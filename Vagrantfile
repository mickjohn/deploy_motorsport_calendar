# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.ssh.username = "vagrant"
  config.ssh.password = "vagrant"
  config.vm.box  = "bento/ubuntu-18.04"
  config.vm.network "forwarded_port", guest: 80, host: 8888
  config.vm.network "forwarded_port", guest: 443, host: 8443
  config.vm.network "forwarded_port", guest: 8010, host: 8010
end
