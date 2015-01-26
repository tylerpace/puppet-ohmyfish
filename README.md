# puppet-ohmyfish

This module installs the [Fish](http://www.fishshell.com) shell and the [Oh My Fish!](https://github.com/bpinto/oh-my-fish) framework via [Puppet](http://puppetlabs.com/). The module supports basic management of Fish and oh-my-fish including the installation of themes and plugins.

## Usage

```
# for a single user
ohmyfish::install { 'user1': }

# for multiple users in one shot and set their shell to fish
ohmyfish::install { ['root', 'user1']: set_sh => true }

# install a theme for a user
ohmyfish::fetch::theme { 'root': url => 'http://.com/files/dotfiles/Fish/squared.zsh-theme' }

# set a theme for a user
ohmyfish::theme { ['root', 'user1']: } # would install 'clean' theme as default

ohmyfish::theme { ['root', 'user1']: theme => 'robbyrussell' } # specific theme

# activate plugins for a user
ohmyfish::plugins { 'user1': plugins => 'git github' }

# upgrade Fish for a single user
ohmyfish::upgrade { 'user1': }
```

Support
-------

Please log tickets and issues on [GitHub](https://github.com/tylerpace/puppet-ohmyfish).


Acknowlegments
--------------

This module was originally a fork of [zanloy/puppet-ohmyzsh](https://github.com/zanloy/puppet-ohmyzsh) at version 0.1.2.
