# Public: Install Sequel Pro to /Applications.
#
# Examples
#
#   include sequel_pro
class sequel_pro {
  package { 'Sequel Pro':
    provider => 'appdmg',
    source   => 'http://sequel-pro.googlecode.com/files/sequel-pro-1.0.1.dmg',
  }
}
