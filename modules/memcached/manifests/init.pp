class memcached {
  include homebrew
  include memcached::config

  file { [$memcached::config::datadir, $memcached::config::logdir]:
    ensure => directory
  }

  file { '/Library/LaunchDaemons/dev.memcached.plist':
    content => template('memcached/dev.memcached.plist.erb'),
    group   => 'wheel',
    notify  => Service['dev.memcached'],
    owner   => 'root'
  }

  homebrew::formula { 'memcached':
    before => Package['boxen/brews/memcached'],
  }

  package { 'boxen/brews/memcached':
    ensure => '1.4.13-boxen1',
    notify => Service['dev.memcached']
  }

  service { 'dev.memcached':
    ensure  => running,
    require => Package['boxen/brews/memcached']
  }

  service { 'com.boxen.memcached': # replaced by dev.memcached
    before => Service['dev.memcached'],
    enable => false
  }

  file { "${boxen::config::envdir}/memcached.sh":
    content => template('memcached/env.sh.erb'),
    require => File[$boxen::config::envdir]
  }
}
