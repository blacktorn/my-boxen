class people::blacktorn {
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

  repository { 'robbyrussell/oh-my-zsh':
    source => 'robbyrussell/oh-my-zsh',
    path   => "${home}/.oh-my-zsh"
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
  include osx::finder::empty_trash_securely
  include osx::finder::unhide_library
  include osx::dock::autohide
  include osx::dock::icon_size
  include osx::no_network_dsstores

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
  include ctags
  include vim

  git::config::global { 'user.name':
    value => 'Dennis Vermeulen'
  }
  git::config::global { 'user.email':
    value => 'dennis@wecreatepixels.nl'
  }

  vim::bundle { [
    'rizzatti/funcoo.vim',
    'rizzatti/dash.vim',
    'scrooloose/syntastic',
    'scrooloose/nerdtree',
    'majutsushi/tagbar',
    'godlygeek/tabular',
    'airblade/vim-gitgutter',
    'Townk/vim-autoclose',
    'SirVer/ultisnips',
    'ervandew/supertab',
    'mattn/emmet-vim',
    'tpope/vim-fugitive',
    'rodjek/vim-puppet',
    'csscomb/csscomb-for-vim',
    'kien/ctrlp.vim',
    'tomasr/molokai'
  ]: }

  file { "${vim::vimrc}":
    ensure  => 'link',
    target  => "${dotfiles}/vimrc",
    require => Repository[$dotfiles]
  }

  # personal packages
  package {
    [
      'tmux'
    ]:
  }
  package { 'Powerline':
    provider => pip,
    source   => 'git+git://github.com/Lokaltog/powerline',
    require  => Class['python']
  }

  # apps
  include iterm2::dev
  include firefox
  include chrome
  include flux
  include alfred
  include skitch
  include sourcetree
  include spotify
  include virtualbox
  include vagrant
}
