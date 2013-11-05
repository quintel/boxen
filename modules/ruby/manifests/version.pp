# Installs a ruby version via rbenv.
# Takes ensure, env, and version params.
#
# Usage:
#
#     ruby::version { '1.9.3-p194': }

define ruby::version(
  $ensure  = 'installed',
  $env     = {},
  $version = $name
) {
  require ruby

  case $::osfamily {
    'Darwin': {
      require xquartz
      include homebrew::config

      $os_env = {
        'BOXEN_S3_HOST'   => $::boxen_s3_host,
        'BOXEN_S3_BUCKET' => $::boxen_s3_bucket,
        'CFLAGS'          => "-I${homebrew::config::installdir}/include -I/opt/X11/include",
        'LDFLAGS'         => "-L${homebrew::config::installdir}/lib -L/opt/X11/lib",
      }
    }

    default: {
      $os_env = {}
    }
  }

  $dest = "${ruby::rbenv_root}/versions/${version}"

  if $ensure == 'absent' {
    file { $dest:
      ensure => absent,
      force  => true
    }
  } else {
    $default_env = {
      'CC'         => '/usr/bin/cc',
      'RBENV_ROOT' => $ruby::rbenv_root
    }

    $final_env = merge(merge($default_env, $os_env), $env)

    exec { "ruby-install-${version}":
      command     => "${ruby::rbenv_root}/bin/rbenv install ${version}",
      cwd         => "${ruby::rbenv_root}/versions",
      provider    => 'shell',
      timeout     => 0,
      creates     => $dest,
      user        => $ruby::user,
    }
    ->
    ruby::gem { "bundler for ${version}":
      gem     => 'bundler',
      ruby    => $version,
      version => '~> 1.0'
    }

    Exec["ruby-install-${version}"] {
      environment +> sort(join_keys_to_values($final_env, '='))
    }
  }
}
