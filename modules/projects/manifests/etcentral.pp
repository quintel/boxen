class projects::etcentral {
  boxen::project { 'etcentral':
    ruby    => '1.9.3',
    source  => 'https://github.com/quintel/etcentral.git'
  }
}


