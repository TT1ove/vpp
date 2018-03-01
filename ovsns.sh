ovs-vsctl add-br br0
ip netns add ovs1
ip netns add ovs2
ip link add vovs1 type veth peer name vpeerovs1
ip link add vovs2 type veth peer name vpeerovs2
ip link set vpeerovs1 netns ovs1
ip link set vpeerovs2 netns ovs2
ip link set vovs1 up
ip link set vovs2 up

ip netns exec ovs1 ip addr add 172.16.3.2/24 dev vpeerovs1
ip netns exec ovs1 ip link set vpeerovs1 up 
ip netns exec ovs1 ip route add 172.16.4.0/24 via 172.16.3.2
ip netns exec ovs2 ip addr add 172.16.4.2/24 dev vpeerovs2
ip netns exec ovs2 ip link set vpeerovs2 up
ip netns exec ovs2 ip route add 172.16.3.0/24 via 172.16.4.2

ovs-vsctl add-port br0 vovs1
ovs-vsctl add-port br0 vovs2 


