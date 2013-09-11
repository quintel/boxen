class projects::etmodel {
  boxen::project { 'etmodel':
    nginx   => true,
    mysql   => true,
    ruby    => '1.9.3',
    source  => 'quintel/etmodel'
  }
}

