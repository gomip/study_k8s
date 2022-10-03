1. How many deployments exist in the cluster?
    ```
    k get deploy
    ```
2. What is the version of ETCD running on the cluster?
    ```
    k describe pod etcd-controlplane -n kube-system
    ```
3. At what address can you reach the ETCD cluster from the controlplane node?
    ```
    k describe pod etcd-controlplane -n kube-system
    ```
4. Where is the ETCD server certificate file located?
    ```
    k describe pod etcd-controlplane -n kube-system
    ```
5. Where is the ETCD CA Certificate file located?
    ```
    k describe pod etcd-controlplane -n kube-system
    ```
6. The master node in our cluster is planned for a regular maintenance reboot tonight. While we do not anticipate anything to go wrong, we are required to take the necessary backups. Take a snapshot of the ETCD database using the built-in snapshot functionality.   
Store the backup file at location /opt/snapshot-pre-boot.db
    ```
    ETCDCTL_API=3 etcdctl snapshot save /opt/snapshot-pre-boot.db \
      --endpoints=https://[127.0.0.1]:2379 \
      --cacert=/etc/kubernetes/pki/etcd/ca.crt \
      --cert=/etc/kubernetes/pki/etcd/server.crt \
      --key=/etc/kubernetes/pki/etcd/server.key
    ```
7. Great! Let us now wait for the maintenance window to finish. Go get some sleep. (Don't go for real)
8. Wake up! We have a conference call! After the reboot the master nodes came back online, but none of our applications are accessible. Check the status of the applications on the cluster. What's wrong?
    ```
    k get all
    ```
9. Luckily we took a backup. Restore the original state of the cluster using the backup file.
    ```
    ETCDCTL_API=3 etcdctl snapshot restore /opt/snapshot-pre-boot.db \
      --data-dir /var/lib/etcd-backup
    ---
    vi /etc/kubernetes/manifests/etcd.yaml
    ---
    hostPath:
      path: /var/lib/etcd -> etcd-backup
    ```