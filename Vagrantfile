Vagrant.configure("2") do |config|


  config.vm.define "rtr1" do |rtr1|
    rtr1.vm.box = "cisco-csr1kv-csr1000v-universalk9.03.16.03.S.155-3.S3"
    rtr1.vm.boot_timeout = 60
    rtr1.vm.hostname = "rtr1"
    # GigabitEthernet2
    rtr1.vm.network "public_network",use_dhcp_assigned_default_route: true
    # GigabitEthernet3
    rtr1.vm.network "private_network", ip: "192.168.99.11"
    # GigabitEthernet4
    rtr1.vm.network "private_network",  ip: "192.168.56.11"
    rtr1.vm.provider "virtualbox" do |vb|
      vb.name = "rtr1"
      vb.memory = "3072"
      vb.cpus = 2
    end
  end

  config.vm.define "rtr2" do |rtr2|
    rtr2.vm.box = "cisco-csr1kv-csr1000v-universalk9.03.16.03.S.155-3.S3"
    rtr2.vm.hostname = "rtr2"
    # GigabitEthernet2
    rtr2.vm.network "public_network",use_dhcp_assigned_default_route: true
    # GigabitEthernet3
    rtr2.vm.network "private_network", ip: "192.168.99.12"
    # GigabitEthernet4
    rtr2.vm.network "private_network", ip: "192.168.56.12"
    rtr2.vm.provider "virtualbox" do |vb|
      vb.name = "rtr2"
      vb.memory = "3072"
      vb.cpus = 2
    end
  end

  config.vm.define "rtr3" do |rtr3|
    rtr3.vm.box = "cisco-csr1kv-csr1000v-universalk9.03.16.03.S.155-3.S3"
    rtr3.vm.hostname = "rtr3"
    # GigabitEthernet2
    rtr3.vm.network "public_network",use_dhcp_assigned_default_route: true
    # GigabitEthernet3
    rtr3.vm.network "private_network", ip: "192.168.99.13"
    # GigabitEthernet4
    rtr3.vm.network "private_network", ip: "192.168.56.13"
    rtr3.vm.provider "virtualbox" do |vb|
      vb.name = "rtr3"
      vb.memory = "3072"
      vb.cpus = 2
    end
  end  
  
  config.vm.define "control" do |ctl|
    ctl.vm.box = "ubuntu/trusty64"
    ctl.vm.hostname = "control"
    ctl.vm.network "public_network",use_dhcp_assigned_default_route: true
    ctl.vm.network "private_network", ip: "192.168.99.10"
    ctl.vm.provision "shell", path: "provision-trustyansible.sh"
    ctl.vm.provider "virtualbox" do |vb|
      vb.name = "control"
      vb.memory = "2048"
      vb.cpus = 2
    end
  end

end


