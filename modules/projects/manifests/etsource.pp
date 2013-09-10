class projects::etsource {
  boxen::project { 'etsource':
    ruby    => '1.9.3',
    source  => 'quintel/etsource'
  }
}

