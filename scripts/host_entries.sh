# Run this only once
# Modify this manually

# cat << EOF >> /root/.bashrc
# export no_proxy=127.0.0.1,localhost,10.3.20.51,10.3.20.52,10.3.20.*
# EOF

cat << EOF >> /etc/profile.d/set_proxy.sh
export http_proxy=http://web-proxy.corp.hpecorp.net:8080
export https_proxy=http://web-proxy.corp.hpecorp.net:8080
export ftp_proxy=http://web-proxy.corp.hpecorp.net:8080
export no_proxy=”localhost,127.0.0.1,10.3.20.51,10.3.20.52,10.3.20.55,10.3.20.53,10.3.20.54,controller-ecp.gse.com,gateway-ecp.gse.com,epicworker1.gse.com,k8smasterc1.gse.com,k8sworkerc1-1.gse.com,10.192.0.0/12,10.96.0.0/12,*.gse.com”
EOF

cat << EOF >> /etc/hosts
10.3.20.51 controller-ecp.gse.com controller-ecp
10.3.20.52 gateway-ecp.gse.com gateway-ecp
EOF