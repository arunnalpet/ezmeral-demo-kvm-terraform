# configure proxy for yum in /etc/yum.conf
echo "proxy=http://web-proxy.corp.hpecorp.net:8080" >> /etc/yum.conf

# Export proxy
export http_proxy=http://web-proxy.corp.hpecorp.net:8080
export https_proxy=http://web-proxy.corp.hpecorp.net:8080
export no_proxy=localhost,127.0.0.1,10.3.1.*

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

#MANUAL
# vi /etc/selinux/config

# Start services
systemctl enable libvirtd
systemctl start libvirtd

# Clone the repo
git clone  https://github.com/arunnalpet/vmm-kvm-terraform.git

# Download terraform
https://releases.hashicorp.com/terraform/0.14.2/terraform_0.14.2_linux_amd64.zip
# mv it

# Download libvirt plugin
mkdir -p ~/.terraform.d/plugins
# mv plugin here
/root/.local/share/terraform/plugins/registry.terraform.io/dmacvicar/libvirt/0.6.2/linux_amd64/terraform-provider-libvirt

#follow github steps


# Format the drive for libvirt pool
# fdisk /dev/sdc
# g
# n
# p
# w

# mkfs.ext4 /dev/sdc1
mount /dev/sdc1 /var/lib/libvirt/images
# add mount point to /etc/fstab

# Create bridge interface
TYPE="Ethernet"
BOOTPROTO="none"
NAME="ens3f0"
DEVICE="ens3f0"
ONBOOT="yes"
BRIDGE="databr"
NM_CONTROLLED="no"

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



# Create bridged network in virt-manager

#setup passwordless ssh