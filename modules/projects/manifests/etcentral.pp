class projects::etcentral {
  boxen::project { 'etcentral':
    nginx   => true,
    ruby    => '1.9.3',
    source  => 'quintel/etcentral'
  }
}


