# Follow these steps in each node to clean up
# Cleanup script
/opt/bluedata/bundles/common-cp-rhel-release-5.3-3031.bin -ef

#Remove this directory manually
rm -rf /var/lib/monitoring

# Reset persistent and ephermeral disks using the following steps
https://docs.containerplatform.hpe.com/53/reference/deploying-the-platform/additional-functions/Uninstalling_and_Reinstalling.html?hl=uninstalling%2Creinstalling%2Chpe%2Cezmeral%2Ccontainer%2Cplatform

# Resize LVM 
lsof 'filepath'
umount -fl /home
lvs
fuser -kuc /dev/centos/home
ps -eaf | grep mapr
systemctl stop mapr-installer.service
ps -eaf | grep mapr
lvremove  /dev/centos/home
df -h
lvextend -L+300G /dev/centos/root
fdisk -l
lsblk
xfs_growfs /dev/centos/root
vim /etc/fstab
vi /etc/fstab
dracut --regenerate-all --force
df -h