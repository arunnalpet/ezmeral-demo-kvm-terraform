## run basic bluedata pre-req worker node setup ##
(install wget)

## Install NVidia driver ##
## This link is specific to Tesla V100 and Tesla T4 ##
## For other drivers get the download link from https://www.nvidia.com/Download/index.aspx
## IMPORTANT: For Ezmeral installations, always select the 'Linux 64-bit' variant. Do not choose OS specific variant.
## This is for CUDA version 11. 
## Driver and nvidia-smi version: 450.80.02
wget https://us.download.nvidia.com/tesla/450.80.02/NVIDIA-Linux-x86_64-450.80.02.run

# Tesla P100 and CUDA 11.0. Driver and nvidia-smi version: 450.102.04
wget https://us.download.nvidia.com/tesla/450.102.04/NVIDIA-Linux-x86_64-450.102.04.run

#Tesla P40. CUDA 11.2 Toolkit
wget https://us.download.nvidia.com/tesla/460.73.01/NVIDIA-Linux-x86_64-460.73.01.run


# Copy drivers to NVIDIA directory
mkdir /nvidia
cp NVIDIA-Linux-x86_64-450.80.02.run /nvidia/

## Install packages ##
yum update -y
yum install -y kernel-devel kernel-headers gcc-c++ perl pciutils
yum install -y kernel-devel-$(uname -r) kernel-headers-$(uname -r)

## Execute additional steps ## 
cat > /etc/modprobe.d/blacklist-nouveau.conf <<EOF
blacklist nouveau
options nouveau modeset=0
EOF

## run the following ##
rmmod nouveau
dracut --force
reboot

## nouveau module should not be loaded ##
lsmod | grep nouveau

## Install GPU driver ##
cd /nvidia
chmod +x ./NVIDIA-Linux-*.run
./NVIDIA-Linux-*.run -s

## check with nvidia-smi ##
nvidia-smi

## probe nvidia-uvm kernel ##
nvidia-modprobe -u -c=0

## reboot again ##
reboot