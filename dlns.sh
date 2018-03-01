ip netns add dl1
ip netns add dl2

ip link add vdl1 type veth peer name vdl2

ip link set vdl1 netns dl1
ip link set vdl2 netns dl2

ip netns exec dl1 ip link set vdl1 up
ip netns exec dl1 ip addr add 172.16.5.2/24 dev vdl1
ip netns exec dl1 ip route add 172.16.6.0/24 via 172.16.5.2

ip netns exec dl2 ip link set vdl2 up
ip netns exec dl2 ip addr add 172.16.6.2/24 dev vdl2
ip netns exec dl2 ip route add 172.16.5.0/24 via 172.16.6.2
