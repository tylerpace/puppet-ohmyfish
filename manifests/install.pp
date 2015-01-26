# == Define: ohmyfish::install
#
# View README.md for full documentation.
#
# === Parameters
#
# set_sh: (boolean) whether to change the user shell to fish
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

define ohmyfish::install(
  $set_sh = false,
) {

  include ohmyfish::params

  if ! defined(Package['git']) {
    package { 'git':
      ensure => present,
    }
  }

  if ! defined(Package['fish']) {
    package { 'fish':
      ensure => present,
    }
  }

  if $name == 'root' {
    $home = '/root'
  } else {
    $home = "${ohmyfish::params::home}/${name}"
  }

  exec { "ohmyfish::git clone ${name}":
    creates => "${home}/.oh-my-fish",
    command => "git clone https://github.com/bpinto/oh-my-fish.git ${home}/.oh-my-fish",
    path    => ['/bin', '/usr/bin'],
    onlyif  => "getent passwd ${name} | cut -d : -f 6 | xargs test -e",
    user    => $name,
    require => Package['git'],
  }

  exec { "ohmyfish::cp config.fish ${name}":
    creates => "${home}/.config/fish/config.fish",
    command => "cp ${home}/.oh-my-fish/templates/config.fish ${home}/.config/fish/config.fish",
    path    => ['/bin', '/usr/bin'],
    onlyif  => "getent passwd ${name} | cut -d : -f 6 | xargs test -e",
    user    => $name,
    require => Exec["ohmyfish::git clone ${name}"],
  }

  if $set_sh {
    if ! defined(User[$name]) {
      user { "ohmyfish::user ${name}":
        ensure     => present,
        name       => $name,
        managehome => true,
        shell      => $ohmyfish::params::fish,
        require    => Package['fish'],
      }
    } else {
      User <| title == $name |> {
        shell => $ohmyfish::params::fish
      }
    }
  }
}
