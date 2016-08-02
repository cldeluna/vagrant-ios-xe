Vagrant.configure("2") do |config|
  config.vm.box = "cisco-csr1kv-csr1000v-universalk9.03.16.03.S.155-3.S3"
    config.vm.hostname = "rtr1"
    config.vm.network "public_network",use_dhcp_assigned_default_route: true
    config.vm.network "private_network", ip: "192.168.99.11"
    config.vm.provider "virtualbox" do |vb|

      vb.name = "rtr1"
      vb.memory = "3072"
      vb.cpus = 2
    end
    config.vm.provision "shell", inline: "echo config t",
      run: "always"
    config.vm.provision "shell", inline: "echo hostname rtr1",
      run: "always"
end


