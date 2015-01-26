# vagrant init centos64 https://dl.dropboxusercontent.com/s/w3lbekm7eunrskm/centos-7.0-x86_64.box
# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "hashicorp/centos64"

  config.vm.synced_folder ".", "/etc/puppet/modules/ohmyfish"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "tests"
    puppet.manifest_file  = "vagrant.pp"
    puppet.options        = "../"
    puppet.options        = "--verbose --debug"
  end

  config.vm.provision :serverspec do |spec|
    spec.pattern = 'spec/*_spec.rb'
  end

end
