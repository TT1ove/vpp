export UBUNTU="xenial"
export RELEASE=".stable.1801"
rm /etc/apt/sources.list.d/99fd.io.list
 echo "deb [trusted=yes] https://nexus.fd.io/content/repositories/fd.io$RELEASE.ubuntu.$UBUNTU.main/ ./" | sudo tee -a /etc/apt/sources.list.d/99fd.io.list
apt-get update
apt-get install vpp vpp-plugins
