class memcached::lib {
  include memcached

  homebrew::formula { 'libmemcached':
    before => Package['boxen/brews/libmemcached'],
  }

  package { 'boxen/brews/libmemcached':
    ensure  => '1.0.15-boxen1',
    require => Package['boxen/brews/memcached'],
  }

}
