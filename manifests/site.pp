require boxen::environment
require homebrew
require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $boxen_user,

  path => [
    "${boxen::config::home}/rbenv/shims",
    "${boxen::config::home}/rbenv/bin",
    "${boxen::config::home}/rbenv/plugins/ruby-build/bin",
    "${boxen::config::home}/homebrew/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::boxen_user}"
  ]
}

File {
  group => 'staff',
  owner => $boxen_user
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => File["${boxen::config::bindir}/boxen-git-credential"],
  config   => {
    'credential.helper' => "${boxen::config::bindir}/boxen-git-credential"
  }
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {
  # core modules, needed for most things
  include git
  include hub

  # node versions
  include nodejs::v0_10_13

  # default ruby versions
  include ruby::1_9_3
  include ruby::2_0_0

  # General applications
  include mysql
  include memcached
  include pow

  # OSX applications
  include alfred
  include onepassword
  include chrome
  include firefox
  include dropbox
  include iterm2::stable
  include macvim
  include skype
  include sequel_pro
  include zsh
  include sourcetree
  include sublime_text_2
  include caffeine
  include better_touch_tool
  include imagemagick

  # Shell customizations
  include prezto

  # The Quintel projects
  include projects::all

  # common, useful packages
  package {
    [
      'ack',
      'findutils',
      'gnu-tar',
      'z'
    ]:
  }

  file { "${boxen::config::srcdir}/our-boxen":
    ensure => link,
    target => $boxen::config::repodir
  }

  # Load Z!
  file_line { 'z shortcut':
    ensure  => present,
    line    => '. `brew --prefix`/etc/profile.d/z.sh',
    path    => "/Users/${::boxen_user}/.zshrc"
  }

  # Load the boxen environment on login
  file_line { 'boxen environment loading':
    ensure  => present,
    line    => '. /opt/boxen/env.sh',
    path    => "/Users/${::boxen_user}/.zshrc",
    before  => File_line['z shortcut']
  }
}
