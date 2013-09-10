class projects::quintel {

  boxen::project { 'quintel.com':
    mysql         => true,
    ruby          => '1.9.3',
    source        => 'quintel/quintel.com'
  }
}

