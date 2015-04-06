# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  config.vm.provision "shell", inline: <<-SHELL
    sed -i s/archive.ubuntu.com/ftp.jaist.ac.jp/ /etc/apt/sources.list
    apt-get update
    apt-get upgrade -y
    apt-get install -y --no-install-recommends python-setuptools python-dev build-essential
    easy_install pip
    pip install ansible
  SHELL

  config.vm.provision "shell", inline: "ansible-playbook -i 'localhost,' --connection=local /vagrant/playbook.yml", privileged: false
  config.vm.provision "shell", inline: "apt-get autoremove"
end
