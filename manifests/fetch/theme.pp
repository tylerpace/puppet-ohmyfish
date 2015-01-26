# == Define: ohmyfish::fetch::theme
#
# View README.md for full documentation.
#
# === Parameters
#
# url: (string) url of the fish theme to install
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

## fetch and install themes

define ohmyfish::fetch::theme (
  $filename,
  $url = 'UNSET',
  $source = 'UNSET',
  $content = 'UNSET',
  $filename = 'UNSET',
) {

  validate_string($filename, $url, $source, $content, $filename)

  if $name == 'root' {
    $home = '/root'
  } else {
    $home = "/home/${name}"
  }

  $themepath = "${home}/.oh-my-fish/custom/themes"
  $fullpath = "${themepath}/${filename}"

  if ! defined(File[$themepath]) {
    file { $themepath:
      ensure  => directory,
      owner   => $name,
      require => Ohmyfish::Install[$name],
    }
  }

  if $url != 'UNSET' {
    wget::fetch { "ohmyfish::fetch-${name}-${filename}":
      source      => $url,
      destination => $fullpath,
      user        => $name,
      require     => File[$themepath],
    }
  } elsif $source != 'UNSET' {
    file { $fullpath:
      ensure  => present,
      source  => $source,
      owner   => $name,
      require => File[$themepath],
    }
  } elsif $content != 'UNSET' {
    file { $fullpath:
      ensure  => present,
      content => $content,
      owner   => $name,
      require => File[$themepath],
    }
  } else {
    fail('No valid option set.')
  }

}
