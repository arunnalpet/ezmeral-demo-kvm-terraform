# Tested on CentOS Linux release 7.9.2009 (Core)
# configure proxy for yum in /etc/yum.conf
echo "proxy=http://web-proxy.corp.hpecorp.net:8080" >> /etc/yum.conf

# Export proxy
export http_proxy=http://web-proxy.corp.hpecorp.net:8080
export https_proxy=http://web-proxy.corp.hpecorp.net:8080
export no_proxy=localhost,127.0.0.1,10.3.20.*

# install packages
yum install -y wget git libvirt qemu-kvm virt-manager unzip vim

# Configure proxy for git
git config --global http.proxy http://web-proxy.corp.hpecorp.net:8080
git config --global https.proxy http://web-proxy.corp.hpecorp.net:8080

# Stop Firewall
systemctl stop firewalld
systemctl disable firewalld

# Disable selinux
setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config

#MANUAL
# vi /etc/selinux/config

# Start services
systemctl enable libvirtd
systemctl start libvirtd

# Clone the repo
git clone  https://github.com/arunnalpet/ezmeral-demo-kvm-terraform.git

# Download terraform
wget https://releases.hashicorp.com/terraform/0.14.2/terraform_0.14.2_linux_amd64.zip
# mv it
unzip terraform_0.14.2_linux_amd64.zip
mv terraform /usr/local/bin/

# Download libvirt plugin
wget https://github.com/dmacvicar/terraform-provider-libvirt/releases/download/v0.6.2/terraform-provider-libvirt-0.6.2+git.1585292411.8cbe9ad0.Fedora_28.x86_64.tar.gz
mkdir -p /root/.local/share/terraform/plugins/registry.terraform.io/dmacvicar/libvirt/0.6.2/linux_amd64/
# mv plugin here
tar -zxvf terraform-provider-libvirt-0.6.2+git.1585292411.8cbe9ad0.Fedora_28.x86_64.tar.gz
mv terraform-provider-libvirt /root/.local/share/terraform/plugins/registry.terraform.io/dmacvicar/libvirt/0.6.2/linux_amd64/

# Download cloud images

#follow github steps


# Format the drive for libvirt pool
# fdisk /dev/sdc
# g
# n
# p
# w

# mkfs.ext4 /dev/sdc1
mount /dev/sdc1 /var/lib/libvirt/images
# TODO: add mount point to /etc/fstab
# /dev/sdb /var/lib/libvirt/images                   xfs     defaults        0 0
echo "/dev/sdb     /var/lib/libvirt/images           xfs     defaults        0 0" >> /etc/fstab


# Modify network scripts under /etc/sysconfig/network-scripts
# Default Interface (ifcfg-ens3f0)
TYPE="Ethernet"
BOOTPROTO="none"
NAME="ens3f0"
DEVICE="ens3f0"
ONBOOT="yes"
BRIDGE="databr"
NM_CONTROLLED="no"

# Bridge Interface (ifcfg-databr)
# Create this file. This will automatically create a bridge interface.
TYPE="Bridge"
PROXY_METHOD="none"
BROWSER_ONLY="no"
BOOTPROTO="none"
DEFROUTE="yes"
IPV4_FAILURE_FATAL="no"
DEVICE="databr"
ONBOOT="yes"
IPADDR="10.3.20.11"
PREFIX="24"
GATEWAY="10.3.20.1"
DNS1="10.3.20.2"
DNS2="10.3.20.3"
DOMAIN="v0020.sau01.presales.hpecorp.net"
NM_CONTROLLED="no"

# systemctl restart network

# TODO: Create 'default' storage pool.

# TODO
#setup passwordless ssh

# Allow VM's traffic to go outside the bridge networking
# After spinning up initial VMs
# modprobe br_netfilter
sysctl -w net.bridge.bridge-nf-call-arptables=0
sysctl -w net.bridge.bridge-nf-call-ip6tables=0
sysctl -w net.bridge.bridge-nf-call-iptables=0
