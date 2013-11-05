# Public: Install XQuartz into /opt/X11.
#
# Examples
#
#   include xquartz
class xquartz {
  package { 'XQuartz':
    provider => 'pkgdmg',
    source   => 'http://xquartz.macosforge.org/downloads/SL/XQuartz-2.7.4.dmg',
  }
}
