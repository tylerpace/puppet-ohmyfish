class { 'ohmyfish': }

# for a single user
ohmyfish::install { 'vagrant': }->
ohmyfish::upgrade { 'vagrant': }

ohmyfish::install { ['one', 'two']: }
