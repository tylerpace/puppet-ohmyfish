# == Define: ohmyfish::theme
#
# View README.md for full documentation.
#
# === Parameters
#
# theme: (string) name of a fish theme
#
# === Authors
#
# Leon Brocard <acme@astray.com>
# Zan Loy <zan.loy@gmail.com>
# Tyler Pace <tyler.pace@gmail.com>
#
# === Copyright
#
# Copyright 2015
#

define ohmyfish::theme(
  $theme = 'clean',
) {

  include ohmyfish::params

  if $name == 'root' {
    $home = '/root'
  } else {
    $home = "${ohmyfish::params::home}/${name}"
  }

  file_line { "${name}-${theme}-install":
    path    => "${home}/.zshrc",
    line    => "set fish_theme ${theme}",
    match   => '^set fish_theme',
    require => Ohmyfish::Install[$name]
  }

}
