# == Define: ohmyzsh::upgrade
#
# View README.md for full documentation.
#
# === Parameters
#
# None.
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

define ohmyfish::upgrade {

  include ohmyfish::params

  if ! defined(Package['git']) {
    package { 'git':
      ensure => present,
    }
  }

  if $name == 'root' {
    $home = '/root'
  } else {
    $home = "${ohmyfish::params::home}/${name}"
  }

  exec { "ohmyfish::git upgrade ${name}":
    command => 'git pull --rebase --stat origin master',
    path    => ['/bin', '/usr/bin'],
    cwd     => "${home}/.oh-my-zsh",
    user    => $name,
    require => Package['git'],
  }

}
