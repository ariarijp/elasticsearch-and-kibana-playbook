# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  config.vm.provision "file", source: "~/.vagrant.d/insecure_private_key", destination: "~/.ssh/insecure_private_key"
  config.vm.provision "shell", inline: "apt-get update"
  config.vm.provision "shell", inline: "apt-get install python-setuptools"
  config.vm.provision "shell", inline: "easy_install pip"
  config.vm.provision "shell", inline: "pip install ansible"
  config.vm.provision "shell", inline: 'echo "StrictHostKeyChecking no" > ~/.ssh/config', privileged: false
  config.vm.provision "shell", inline: 'chmod 700 ~/.ssh/config && chown vagrant.vagrant ~/.ssh/config', privileged: false
  config.vm.provision "shell", inline: "ansible-playbook -i /vagrant/vagrant_hosts /vagrant/playbook.yml", privileged: false
end
