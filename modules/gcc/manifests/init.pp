# Public: Install gcc via homebrew
#
# Examples
#
#   include gcc
class gcc {

  case $::operatingsystem {
    'Darwin': {
      include homebrew

      case $::macosx_productversion_major {
        '10.8': {
          homebrew::formula { 'apple-gcc42':
            before => Package['boxen/brews/apple-gcc42'],
          }

          package { 'boxen/brews/apple-gcc42':
            ensure => '4.2.1-5666.3-boxen1'
          }
        }

        '10.9': {
          ensure_resource('homebrew::tap', 'homebrew/versions', { 'ensure' => 'present' })

          homebrew::formula { 'gcc48': }

          package { 'boxen/brews/gcc48':
            ensure => '4.8.1-boxen1',
          }
        }

        default: {
          # noop
        }
      }
    }

    default: {
      package { 'gcc': }
    }
  }

}
