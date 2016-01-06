Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
  end

  config.vm.provision "shell", inline: <<-SHELL
    service chef-client stop
    service puppet stop
    update-rc.d chef-client disable
    update-rc.d puppet disable
    sed -i s/archive.ubuntu.com/ftp.jaist.ac.jp/ /etc/apt/sources.list
    apt-add-repository ppa:ansible/ansible
    apt-get update -q
    apt-get install -q -y --no-install-recommends ansible openjdk-7-jre-headless unzip
    mkdir /vagrant/callback_plugins
    cd /vagrant/callback_plugins
    wget -q https://raw.githubusercontent.com/jlafon/ansible-profile/master/callback_plugins/profile_tasks.py
  SHELL

  config.vm.provision "shell", inline: "ansible-playbook -i 'localhost,' --connection=local /vagrant/playbook.yml", privileged: false
  config.vm.provision "shell", inline: "apt-get autoremove -y"
end
