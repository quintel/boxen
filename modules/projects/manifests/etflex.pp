class projects::etflex {
  boxen::project { 'etflex':
    mysql   => true,
    ruby    => '1.9.3',
    source  => 'quintel/etflex'
  }
}

