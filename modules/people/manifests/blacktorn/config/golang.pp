class people::blacktorn::config::golang {
  $go_dir = "${boxen::config::srcdir}/go"
  $go_bin = "${go_dir}/bin"
  $go_pkg = "${go_dir}/pkg"
  $go_src = "${go_dir}/src"

  file { $go_dir:
    ensure  => directory,
    owner   => $::boxen_user,
    group   => staff,
    recurse => true,
  }

  file { $go_bin:
    ensure  => directory,
    owner   => $::boxen_user,
    group   => staff,
    recurse => true,
  }

  file { $go_pkg:
    ensure  => directory,
    owner   => $::boxen_user,
    group   => staff,
    recurse => true,
  }

  file { $go_src:
    ensure  => directory,
    owner   => $::boxen_user,
    group   => staff,
    recurse => true,
  }
}
