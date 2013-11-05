class projects::etmodel {
  boxen::project { 'etmodel':
    mysql   => true,
    ruby    => '1.9.3',
    source  => 'https://github.com/quintel/etmodel.git'
  }
}

