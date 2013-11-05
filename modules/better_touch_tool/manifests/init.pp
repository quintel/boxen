# Public: Install Better Touch Tool.app to /Applications.
#
# Examples
#
#   include better_touch_tool
class better_touch_tool {
  package { 'Better Touch Tool':
    provider => 'compressed_app',
    source   => 'http://bettertouchtool.net/BetterTouchTool.zip'
  }
}
