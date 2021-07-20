- Issue: While creating the cluster, k8s will be able to schedule pods but not create it.
    - Error: Image garbage collection failed multiple times in a row: failed to get imageFs info: unable to find data in memory cache
    - Resolution: Edit ```/etc/sysctl.conf```
        - vm.overcommit_memory=1
        - sysctl --system
        - systemctl restart kubelet
        
    