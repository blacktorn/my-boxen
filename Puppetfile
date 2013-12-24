# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

def github(name, version, options = nil)
  options ||= {}
  options[:repo] ||= "boxen/puppet-#{name}"
  mod name, version, :github_tarball => options[:repo]
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen",      "3.3.4"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "autoconf",   "1.0.0"
github "dnsmasq",    "1.0.0"
github "gcc",        "2.0.1"
github "git",        "1.2.5"
github "homebrew",   "1.5.1"
github "inifile",    "1.0.0", :repo => "puppetlabs/puppetlabs-inifile"
github "openssl",    "1.0.0"
github "repository", "2.2.0"
github "ruby",       "6.7.2"
github "stdlib",     "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",       "1.0.0"
github "xquartz",    "1.1.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.
github "osx",        "2.0.0"
github "python",     "1.3.0"
github "wget",       "1.0.0"
github "heroku",     "2.1.1"
github "flux",       "1.0.0"
github "ctags",      "1.0.0"
github "vim",        "1.0.5"
github "zsh",        "1.0.0"
github "chrome",     "1.1.2"
github "firefox",    "1.1.4"
github "iterm2",     "1.0.4"
github "alfred",     "1.1.6"
github "skitch",     "1.0.2"
github "sourcetree", "1.0.0"
github "spotify",    "1.0.1"
github "virtualbox", "1.0.9"
github "vagrant",    "3.0.0"
