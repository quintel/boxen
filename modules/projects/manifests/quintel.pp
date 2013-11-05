class projects::quintel {
  boxen::project { 'quintel.com':
    ruby    => '1.9.3',
    source  => 'https://github.com/quintel/quintel.com.git'
  }
}

