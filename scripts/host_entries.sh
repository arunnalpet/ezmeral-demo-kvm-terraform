# Run this only once
# Modify this manually

cat << EOF >> /root/.bashrc
export no_proxy=127.0.0.1,localhost,10.3.20.51,10.3.20.52,10.3.20.*
EOF

cat << EOF >> /etc/hosts
10.3.20.51 controller-ecp.gse.com controller-ecp
10.3.20.52 gateway-ecp.gse.com gateway-ecp
EOF