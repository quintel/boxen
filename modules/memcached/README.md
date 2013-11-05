# Memcached Puppet Module for Boxen

## Usage

```puppet
include memcached
```

The `libmemcached` library is also available:
```puppet
include memcached::lib
```

## Required Puppet Modules

* boxen
* homebrew
* stdlib


## Environment

Once installed, you can access the following variables in your environment, projects, etc:

* BOXEN_MEMCACHED_PORT: the configured memcached port
* BOXEN_MEMCACHED_URL: the URL for memcached, including host & port

#### Rails with Dalli

For Rails development with the [dalli](https://github.com/mperham/dalli) client, add to `config/environments/development.rb`:

    config.cache_store = :dalli_store, "127.0.0.1:#{ENV['BOXEN_MEMCACHED_PORT'] || 11211}"
