class projects::energymixer {
  boxen::project { 'energymixer':
    nginx   => true,
    mysql   => true,
    ruby    => '1.9.3',
    source  => 'quintel/energymixer'
  }
}

