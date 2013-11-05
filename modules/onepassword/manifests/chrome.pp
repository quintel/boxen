# Install 1Password into /Applications
# Install Chrome extension via update URL
#
# Usage:
#
#     include onepassword::chrome
class onepassword::chrome {

  $chrome_dir = "/Users/${::luser}/Library/Application Support/Google/Chrome/External Extensions"

  file { 'chrome_extensions_dir':
    ensure  => directory,
    path    => $chrome_dir,
    mode    => '0755',
    require => [Package['Chrome'],Package['1Password']];
  }

  file { 'onepassword_chrome_extension':
    ensure  => present,
    path    => "${chrome_dir}/gkndfifopckmhdkohjeoljlbfnjhekfg.json",
    source  => 'puppet:///modules/onepassword/chrome.json',
    mode    => '0644',
    require => [Package['Chrome'],Package['1Password'],File['chrome_extensions_dir']];
  }

}
