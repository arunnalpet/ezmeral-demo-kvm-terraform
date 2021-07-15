# Meant to run only one time.
# If script fails, run commands manually

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

# Run pre-check and generate config file
wget https://bdk8s.s3.us-east-2.amazonaws.com/5.3/3031/hpe-cp-rhel-prechecks-5.3.bin
chmod +x ./hpe-cp-rhel-prechecks-5.3.bin
./hpe-cp-rhel-prechecks-5.3.bin --proxy http://web-proxy.corp.hpecorp.net:8080

# Run ezmeral installer
# Download Link

# TODO: CLI to accept EULA
chmod +x ./hpe-cp-rhel-release-5.2-3020.bin
./hpe-cp-rhel-release-5.2-3020.bin --prechecks-config-file /tmp/bd_prechecks.conf --default-password admin123

