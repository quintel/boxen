class projects::etsource {
  boxen::project { 'etsource':
    ruby    => '1.9.3',
    source  => 'https://github.com/quintel/etsource.git'
  }
}

