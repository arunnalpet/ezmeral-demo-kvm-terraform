# Meant to run only one time.
# If script fails, run commands manually

# Install necessary packages
yum install -y wget vim python

# Insert Controller's public key information

# set selinux to Permissive
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
setenforce 0

# Prepare disks
# Assuming disks are /dev/vdb and /dev/vdc
(echo g; echo w) | fdisk /dev/vdb
(echo g; echo w) | fdisk /dev/vdc

