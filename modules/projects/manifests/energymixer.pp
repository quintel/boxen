class projects::energymixer {
  boxen::project { 'energymixer':
    mysql   => true,
    ruby    => '1.9.3',
    source  => 'https://github.com/quintel/energymixer.git'
  }
}

