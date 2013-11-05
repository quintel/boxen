# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod name, :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.3.4"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "osx",         "1.6.0"
github "gcc",         "2.0.99"
github "git",         "1.3.5"
github "homebrew",    "1.6.0"
github "hub",         "1.1.0"
github "inifile",     "1.0.0", :repo => "puppetlabs/puppetlabs-inifile"
github "nodejs",      "3.3.0"
github "repository",  "2.2.0"
github "ruby",        "6.5.0"
github "stdlib",      "4.0.2", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "openssl",     "1.0.0"
github "xquartz",     "1.1.0"
github "memcached",   "1.2.0"
github "imagemagick", "1.2.1"
github "pow",         "1.0.0"

# Adding Quintel specific modules.

github "alfred",      "1.1.6"
github "chrome",      "1.1.1"
github "dropbox",     "1.1.2"
github "firefox",     "1.1.4"
github "iterm2",      "1.0.3"
github "macvim",      "1.0.0"
github "onepassword", "1.0.2"
github "sequel_pro",  "1.0.0"
github "skype",       "1.0.4"
github "wget",        "1.0.0"
github "zsh",         "1.0.0"
github "mysql",       "1.1.5"
github "sourcetree",  "1.0.0"
github "prezto",      "1.0.1", :repo => "archfear/puppet-prezto"
github "sublime_text_2", "1.1.2"
github "caffeine",    "1.0.0"
github "better_touch_tool", "1.0.0", :repo => "andremedeiros/puppet-better_touch_tool"
