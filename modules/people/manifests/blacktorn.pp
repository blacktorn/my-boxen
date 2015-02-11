class people::blacktorn {
  include people::blacktorn::config::golang

  $home     = "/Users/${::boxen_user}"
  $my       = "${home}/my"
  $dotfiles = "${my}/dotfiles"

  file { $my:
    ensure  => directory
  }

  repository { $dotfiles:
    source  => 'blacktorn/dotfiles',
    require => File[$my]
  }

  file { "${home}/.zshrc":
    ensure  => 'link',
    target  => "${dotfiles}/zshrc",
    require => Repository[$dotfiles]
  }

  file { "${home}/.tmux.conf":
    ensure  => 'link',
    target  => "${dotfiles}/tmux.conf",
    require => Repository[$dotfiles]
  }

  # os x settings
  include osx::global::disable_key_press_and_hold
  include osx::global::enable_keyboard_control_access
  include osx::global::expand_save_dialog
  include osx::finder::show_external_hard_drives_on_desktop
  include osx::finder::unhide_library
  include osx::dock::autohide
  include osx::dock::icon_size
  include osx::no_network_dsstores

  class { 'osx::dock::position':
    position => 'left'
  }

  boxen::osx_defaults { 'Disable Dashboard':
    key    => 'mcx-disabled',
    domain => 'com.apple.dashboard',
    value  => 'YES',
  }
  boxen::osx_defaults { 'Always use current directory in default search':
    key    => 'FXDefaultSearchScope',
    domain => 'com.apple.finder',
    value  => 'SCcf',
  }
  boxen::osx_defaults { 'Disable reopen windows when logging back in':
    key    => 'TALLogoutSavesState',
    domain => 'com.apple.loginwindow',
    value  => 'false',
  }

  include heroku
  include zsh
  include oh_my_zsh
  include ctags
  #include vim

  git::config::global { 'user.name':
    value => 'Dennis Vermeulen'
  }
  git::config::global { 'user.email':
    value => 'dennis@wecreatepixels.nl'
  }

  # personal packages
  package {
    [
      'tmux'
    ]:
  }

  class { 'nodejs::global': version => 'v0.10.29' }

  # apps
  include iterm2::dev
  include firefox
  include chrome
  include flux
  include alfred
  include skitch
  include sourcetree
  include dropbox
  include spotify
  include contexts
  include pgadmin3

  class { 'virtualbox':
    version     => '4.3.20',
    patch_level => '96996'
  }

  vagrant::plugin { 'salt': }
  vagrant::box { 'precise64/virtualbox':
    source => 'http://files.vagrantup.com/precise64.box'
  }

  class { 'intellij':
    edition => 'ultimate',
    version => '13.1.5'
  }

  class { 'kaleidoscope':
    make_default => false,
    version      => '2.1.0-134'
  }
}
