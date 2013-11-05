# Public: Show external hard drives on the desktop.
class osx::finder::show_external_hard_drives_on_desktop {
  include osx::finder

  boxen::osx_defaults { 'Show external drives on the desktop':
    user   => $::boxen_user,
    domain => 'com.apple.finder',
    key    => 'ShowExternalHardDrivesOnDesktop',
    value  => true,
    notify => Exec['killall Finder'];
  }
}
