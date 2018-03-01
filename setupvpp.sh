vppctl create vhost socket /tmp/sock1.sock server
vppctl create vhost socket /tmp/sock2.sock server
vppctl set interface state VirtualEthernet0/0/0 up
vppctl set interface state VirtualEthernet0/0/1 up

vppctl set interface l2 bridge VirtualEthernet0/0/0 1
vppctl set interface l2 bridge VirtualEthernet0/0/1 1
