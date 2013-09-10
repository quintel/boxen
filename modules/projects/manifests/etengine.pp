class projects::etengine {
  boxen::project { 'etengine':
    mysql   => true,
    ruby    => '1.9.3',
    source  => 'quintel/etengine'
  }
}

