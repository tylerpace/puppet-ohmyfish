# == Define: ohmyfish::plugins
#
# View README.md for full documentation.
#
# === Parameters
#
# plugins: (string) space separated list of fish plugins
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

define ohmyfish::plugins(
  $plugins = 'git',
) {

  include ohmyfish::params

  if $name == 'root' {
    $home = '/root'
  } else {
    $home = "${ohmyfish::params::home}/${name}"
  }

  if is_array($plugins) {
    $plugins_real = join($plugins, ' ')
  } else {
    validate_string($plugins)
    $plugins_real = $plugins
  }

  file_line { "${name}-${plugins_real}-install":
    path    => "${home}/.config/fish/config.fish",
    line    => "set fish_plugins ${plugins_real}",
    match   => '^set fish_plugins',
    require => Ohmyfish::Install[$name]
  }

}
