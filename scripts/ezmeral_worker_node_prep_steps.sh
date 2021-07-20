# Meant to run only one time.
# If script fails, run commands manually

# Manually set hostnames of all other hosts.
# hostnamectl set-hostname ezcontroller.v0020.gselr5
# Or
# Configure hostnames in the DNS server

# Check Timezone uniform
# TODO: move this to cloud-config
# timedatectl set-timezone UTC
# ntpdate 10.3.20.11

# Install necessary packages
yum-config-manager --disable updates
yum install -y wget vim python

# Insert Controller's public key information

# set selinux to Permissive
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
setenforce 0

# Prepare disks
# Assuming disks are /dev/vdb and /dev/vdc
(echo g; echo w) | fdisk /dev/vdb
(echo g; echo w) | fdisk /dev/vdc

# TODO
# Add DNS entries
# Enabling proxy inside docker