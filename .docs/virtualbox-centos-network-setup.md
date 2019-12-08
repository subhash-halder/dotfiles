## Setup guide for centos network on virtualbox

# network adapter 1
  Attached to: NAT
# network adapter 2
  Attached to: Host-only Adapter
  Name : vboxnet0 (need to be created from file menu from virtualbox)


# Setup on centos

[root@localhost ~]# nmcli dev status
DEVICE  TYPE      STATE      CONNECTION 
enp0s3  ethernet  connected  enp0s3     
enp0s8  ethernet  connected  enp0s8     
lo      loopback  unmanaged  --        

[root@localhost ~]# nmcli con show
NAME    UUID                                  TYPE      DEVICE 
enp0s3  3dbe4296-0b57-4d1d-bd0f-511d53242d80  ethernet  enp0s3 
enp0s8  349177c9-b8c2-368d-a7d8-a75654e369b5  ethernet  enp0s8 
eth0    36a50baa-0bb1-41af-b71c-6807f4fdaecd  ethernet  --    

[root@localhost ~]# cd /etc/sysconfig/network-scripts/

[root@localhost network-scripts]# cat ifcfg-enp0s3
TYPE=Ethernet
PROXY_METHOD=none
BROWSER_ONLY=no
BOOTPROTO=dhcp
DEFROUTE=yes
IPV4_FAILURE_FATAL=no
IPV6INIT=yes
IPV6_AUTOCONF=yes
IPV6_DEFROUTE=yes
IPV6_FAILURE_FATAL=no
IPV6_ADDR_GEN_MODE=stable-privacy
NAME=enp0s3
UUID=3dbe4296-0b57-4d1d-bd0f-511d53242d80
DEVICE=enp0s3
ONBOOT=yes

[root@localhost network-scripts]# cat ifcfg-enp0s8
TYPE="Ethernet"
BOOTPROTO="static"
IPADDR=192.168.56.10
DEFROUTE="yes"
PEERDNS="yes"
PEERROUTES="yes"
IPV4_FAILURE_FATAL="no"
IPV6INIT="yes"
IPV6_AUTOCONF="yes"
IPV6_DEFROUTE="yes"
IPV6_PEERDNS="yes"
IPV6_PEERROUTES="yes"
IPV6_FAILURE_FATAL="no"
NAME="enp0s8"
UUID="349177c9-b8c2-368d-a7d8-a75654e369b5"
DEVICE="enp0s8"
ONBOOT="yes"
