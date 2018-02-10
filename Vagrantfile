# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 3
  end
  config.ssh.username = "vagrant"

  config.vm.synced_folder "./src", "/go/src"  # don't sync bin or pkg

  config.vm.provision "shell", path: 'setup-root.sh'
  config.vm.provision "shell", privileged: false, path: 'setup-user.sh'
end
