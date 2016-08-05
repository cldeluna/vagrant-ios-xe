# 3-Node + Ansible Control Server
## Vagrant configuration with three Cisco CSR1000v routers (4 interfaces each) and one Ubuntu 14.04 server acting as an Asible Control System 
## Basic Cisco IOS-XE Environment for Testing Ansible Roles

###Requirements:
+ VirtualBox

+ Vagrant

+ Cisco CSR1000v ISO Image

###Instructions:

You will need to download the csr1000v iso image from cisco.com.
Once you have the iso image bring up a new VM in VirtualBox accepting all the defaults but these:

* Name - csr1000v

* Base OS = OtherLinux64

* Memory = 3072

* Enable Serial Port (Port mode can be Disconnected)

Once the VM is built and booted without the iso mounted, shut it down.
At this point it is ready to be packaged so it can be used as a box in the 3-node lab.

```

vagrant package --base cisco-csr1kv --output C:\Users\Claudia\.vagrant.d\boxes\cisco-csr1kv
vagrant box add cisco-csr1kv-csr1000v-universalk9.03.16.03.S.155-3.S3  C:/Users/Claudia/Dropbox/scripts/vagrant/ios-xe/UsersClaudia.vagrant.dboxescisco-csr1kv
$ vagrant box list
cisco-csr1kv-csr1000v-universalk9.03.16.03.S.155-3.S3 (virtualbox, 0)
freebsd-10                                            (virtualbox, 0)
hashicorp/precise64                                   (virtualbox, 1.1.0)
ubuntu/trusty64                                       (virtualbox, 20160729.0.0)


```

Clone or download the repository from GitHub.

That becomes the project directory

```
vagrant up --provider=virtualbox

```

Once all the VMS have been created and provisioned, the three routers will need a bootstrap configuration via the VirtualBox GUI console so that they can be accessed via ssh.  Once that is in place they can be accessed by the control server.


### rtr1 base config

```
!Bootstrap Config for ssh


hostname rtr1

enable secret vagrant
!
aaa new-model
!
username vagrant password vagrant

!#  configure so that authentication use has priv 15 and goes into enable mode
username vagrant privilege 15 password vagrant
aaa authentication login default local
aaa authorization exec default local

ip domain-name uwaco.com
!
!
crypto key gen rsa mod 1024

interface GigabitEthernet2
 no shut
 ip address dhcp


!#### Paste in
interface GigabitEthernet1
  desc NAT Interface for Vagrant
  no ip address
  shutdown

!
interface GigabitEthernet2
  desc Bridged Interface on Local Lan
  no shut

!
interface GigabitEthernet3
  desc Host Only Network
  no shut
  ip address 192.168.99.11 255.255.255.0

interface GigabitEthernet4
  desc Host Only Network
  no shut
  ip address 192.168.56.11 255.255.255.0
!

!interface loopback0
! desc Primary Loopback for Routing
! ip address 1.1.1.11 255.255.255.255
!
end
wr mem
sh ip int br
```


### rtr2 base config

```
hostname rtr2

enable secret vagrant
!
aaa new-model
!
username vagrant password vagrant

!#  configure so that authentication use has priv 15 and goes into enable mode
username vagrant privilege 15 password vagrant
aaa authentication login default local
aaa authorization exec default local

ip domain-name uwaco.com
!
!
crypto key gen rsa mod 1024

interface GigabitEthernet2
 no shut
 ip address dhcp


!#### Paste in
interface GigabitEthernet1
  desc NAT Interface for Vagrant
  no ip address
  shutdown
!
 interface GigabitEthernet2
  desc Bridged Interface on Local Lan
  no shut

!
interface GigabitEthernet3
  desc Host Only Network
  no shut
  ip address 192.168.99.12 255.255.255.0

interface GigabitEthernet4
  desc Host Only Network
  no shut
  ip address 192.168.56.12 255.255.255.0
!

interface loopback0
  desc Primary Loopback for Routing
  ip address 1.1.1.12 255.255.255.255
!
end
wr mem
sh ip int br
```

### rtr3 base config

```
 hostname rtr3

enable secret vagrant
 !
aaa new-model
!
username vagrant password vagrant

!#  configure so that authentication use has priv 15 and goes into enable mode
username vagrant privilege 15 password vagrant
aaa authentication login default local
aaa authorization exec default local

ip domain-name uwaco.com
!
!
crypto key gen rsa mod 1024

interface GigabitEthernet2
no shut
ip address dhcp


!#### Paste in
interface GigabitEthernet1
  desc NAT Interface for Vagrant
  no ip address
  shutdown

!
interface GigabitEthernet2
  desc Bridged Interface on Local Lan
  no shut

!
interface GigabitEthernet3
  desc Host Only Network
  no shut
  ip address 192.168.99.11 255.255.255.0

interface GigabitEthernet4
  desc Host Only Network
  no shut
  ip address 192.168.56.11 255.255.255.0
!

interface loopback0
  desc Primary Loopback for Routing
  ip address 1.1.1.11 255.255.255.255
  !
end
wr mem
sh ip int br
```




