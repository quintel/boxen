# On Mac OS X, MacVim can't build without a full Xcode install.

class macvim {
  case $::osfamily {
    'Darwin': {
      package { 'macvim':
        ensure          => installed,
        install_options => [
          '--with-cscope',
          '--override-system-vim',
          ];
      }
    }

    default: {}
  }
}
