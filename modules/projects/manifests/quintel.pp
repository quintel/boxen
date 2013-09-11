class projects::quintel {
  boxen::project { 'quintel.com':
    nginx   => true,
    ruby    => '1.9.3',
    source  => 'quintel/quintel.com'
  }
}

