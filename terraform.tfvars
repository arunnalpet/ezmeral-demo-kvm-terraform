# myvms = [
#    {
#         hostname = "centos01"
#         osdisk_gb = 20
#         CPU_Count = 4
#         RAM = 256
#         Image = "CentOS-7-x86_64-GenericCloud.qcow2"
#     } ,
#     {
#         hostname = "ubuntu01"
#         osdisk_gb = 40
#         CPU_Count = 8
#         RAM = 512
#         Image = "ubuntu-16.04-server-cloudimg-amd64-disk1.img"
#     }
# ]

# Common Variables
nwgw     = "10.3.20.1"
nwdns1   = "10.3.20.11"
nwdns2   = "10.3.20.2"
nwdnsdom = "v0020.sau01.presales.hpecorp.net"
nwhostdom = "gse.com"

myvms = {
  vm1 = {
    hostname    = "controller-ecp"
    osdisk_gb   = 500
    ephdisk_gb  = 500
    persdisk_gb = 500
    CPU_Count   = 8
    RAM         = 128
    Image       = "CentOS-7-x86_64-GenericCloud.qcow2"
    nwip        = "10.3.20.51/24"
  }
  vm2 = {
    hostname    = "gateway-ecp"
    osdisk_gb   = 500
    ephdisk_gb  = 1
    persdisk_gb = 1
    CPU_Count   = 8
    RAM         = 96
    Image       = "CentOS-7-x86_64-GenericCloud.qcow2"
    nwip        = "10.3.20.52/24"
  }
}
