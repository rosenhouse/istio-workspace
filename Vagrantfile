# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 3
  end

  config.vm.synced_folder (ENV["GOPATH"] + "/src/istio.io/istio"), "/go/src/istio.io/istio"
  config.vm.synced_folder ".", "/istio-workspace"

  # setup as root user
  config.vm.provision "shell", inline: <<-SHELL
    set -e -x -u
    apt-get update -y || (sleep 40 && apt-get update -y)
    apt-get install -y git build-essential
    wget -qO- https://storage.googleapis.com/golang/go1.9.3.linux-amd64.tar.gz | tar -C /usr/local -xz
    echo 'export GOPATH=/go; export PATH=/usr/local/go/bin:$GOPATH/bin:$PATH' >> /home/ubuntu/.bashrc
    chown ubuntu /go
    chown ubuntu /go/src
  SHELL

  # setup as ubuntu user
  config.vm.provision "shell", path: "setup.sh", privileged: false
end
