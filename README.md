# ezmeral-demo-kvm-terraform (WIP)
Terraform scripts to build and host Ezmeral on KVM infrastructure
Cloud-init tested on Centos 7.6.1810

#### Downloads:
Tool | Link 
--- | ---
Terraform | [v0.14.2](https://releases.hashicorp.com/terraform/0.14.2/terraform_0.14.2_linux_amd64.zip)
libvirt | [v0.6.2 on Ubuntu 18.04](https://github.com/dmacvicar/terraform-provider-libvirt/releases/download/v0.6.2/terraform-provider-libvirt-0.6.2+git.1585292411.8cbe9ad0.Ubuntu_18.04.amd64.tar.gz)
libvirt | [v0.6.2 on Centos 7.6.1810](https://github.com/dmacvicar/terraform-provider-libvirt/releases/download/v0.6.2/terraform-provider-libvirt-0.6.2+git.1585292411.8cbe9ad0.Fedora_28.x86_64.tar.gz)

#### Tested on versions:
```shell
#> terraform version
Terraform v0.14.2
+ provider registry.terraform.io/dmacvicar/libvirt v0.6.2
+ provider registry.terraform.io/hashicorp/template v2.2.0
```

#### Current terraform plugin found at:
```shell
/root/.local/share/terraform/plugins/registry.terraform.io/dmacvicar/libvirt/0.6.2/linux_amd64/terraform-provider-libvirt
```

# Steps
- Update VM details in ```terraform.tfvars```
- Make sure ```no_proxy``` is properly hardcoded in ```conf/cloud_init.cfg```
- Make sure the path is properly set in  ```/modules/singlevm/main.tf```, for cloud-image and cloud-config directories.
- Make sure you have provided proper bridge interface in ```/modules/singlevm/main.tf```
- For each VM, host entries has to be added manually at the moment. Fill in ```scripts/host_entries.sh``` accordingly
- Password to login to vm is configured in conf/cloud_init.cfg. Default is root/ezmeral