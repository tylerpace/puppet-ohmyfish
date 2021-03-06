# == Define: ohmyfish::params
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

class ohmyfish::params {

  case $::osfamily {
    'Redhat': {
      $fish = '/usr/bin/fish'
    }
    default: {
      $fish = '/usr/bin/fish'
    }
  }

  $home = '/home'

}
