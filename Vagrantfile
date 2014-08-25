# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.synced_folder "saltstack/salt", "/srv/salt"
  config.vm.synced_folder ".", "/home/vagrant/salt/"
  config.vm.synced_folder "../review.ninja", "/home/vagrant/review.ninja"

  config.vm.network :forwarded_port, host: 5000, guest: 5000

  config.vm.provision :salt do |salt|
    salt.minion_config = "saltstack/minion"
    salt.run_highstate = true
    salt.verbose = true
  end
end
