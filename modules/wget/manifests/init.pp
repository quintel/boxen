# Public: Install wget via homebrew
#
# Examples
#
#   include wget
class wget {
  include homebrew

  package { 'wget': }
}
