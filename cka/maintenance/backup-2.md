1. In this lab environment, you will get to work with multiple kubernetes clusters where we will practice backing up and restoring the ETCD database.
2. You will notice that, you are logged in to the student-node (instead of the controlplane).   
The student-node has the kubectl client and has access to all the Kubernetes clusters that are configured in thie lab environment.   
Before proceeding to the next question, explore the student-node and the clusters it has access to.
3. How many clusters are defined in the kubeconfig on the student-node?
    ```
    k config get-contexts
    ```
4. How many nodes (both controlplane and worker) are part of cluster1?
    ```
    k get nodes
    ```
5. What is the name of the controlplane node in cluster2?
    ```
    k config use-context cluster2
    ---
    k get node
    ```
6. You can SSH to all the nodes (of both clusters) from the student-node.   
    ```
    ssh cluster1-controlplane
    ```
    To get back to the student node, use the logout or exit command, or, hit Control +D 
7. How is ETCD configured for cluster1?   
Remember, you can access the clusters from student-node using the kubectl tool. You can also ssh to the cluster nodes from the student-node.
    ```
    k config use-context cluster1
    ---
    k describe pod -n kube-system etcd-cluster1-controlplane
    ```
8. How is ETCD configured for cluster2?
    ```
    k config use-context cluster2
    ---
    k describe pod -n kube-system kube-apiserver-cluster2-controlplane | grep etcd
    ```
9. What is the IP address of the External ETCD datastore used in cluster2?
    ```
    k describe pod -n kube-system kube-apiserver-cluster2-controlplane | grep etcd
    ```
10. What is the default data directory used the for ETCD datastore used in cluster1?   
Remember, this cluster uses a Stacked ETCD topology.
    ```
    k config use-context cluster1
    ---
    k describe pod -n kube-system etcd-controlplane 
    ---
    ```
11. For the subsequent questions, you would need to login to the External ETCD server.   
To do this, open a new terminal (using the + button located above the default terminal).   
From the new terminal you can now SSH from the student-node to either the IP of the ETCD datastore (that you identified in the previous questions) OR the hostname etcd-server:
12. What is the default data directory used the for ETCD datastore used in cluster2?
    ```
    어렵다
    k config use-context cluster2
    ---
    k describe pod -n kube-system kube-apiserver-cluster2-controlplane | grep etcd
    ```
13. How many nodes are part of the ETCD cluster that etcd-server is a part of?
    ```
    ETCDCTL_API=3 etcdctl \
    --endpoints=https://127.0.0.1:2379 \
    --cacert=/etc/etcd/pki/ca.pem \
    --cert=/etc/etcd/pki/etcd.pem \
    --key=/etc/etcd/pki/etcd-key.pem \
    member list
    ```
14. Take a backup of etcd on cluster1 and save it on the student-node at the path /opt/cluster1.db
    ```
    k config use-context cluster1
    ---
ETCDCTL_API=3 etcdctl snapshot save /opt/cluster1.db \
--endpoints=https://[127.0.0.1]:2379 \
--cacert=/etc/kubernetes/pki/etcd/ca.crt \
--cert=/etc/kubernetes/pki/etcd/server.crt \
--key=/etc/kubernetes/pki/etcd/server.key
    ---
    exit
    ---
    scp cluster1-controlplane:/opt/cluster1.db /opt
    ```
15. An ETCD backup for cluster2 is stored at /opt/cluster2.db. Use this snapshot file to carryout a restore on cluster2 to a new path /var/lib/etcd-data-new.   
Once the restore is complete, ensure that the controlplane components on cluster2 are running.   
The snapshot was taken when there were objects created in the critical namespace on cluster2. These objects should be available post restore.
    ```
    k config use-context cluster2
    ---
    scp /opt/cluster2.db etcd-server:/root
    ---
    ssh etcd-server
    ---
ETCDCTL_API=3 etcdctl snapshot restore /root/cluster2.db \
--data-dir /var/lib/etcd-data-new \
--endpoints=https://127.0.0.1:2379 \
--cacert=/etc/etcd/pki/ca.pem \
--cert=/etc/etcd/pki/etcd.pem \
--key=/etc/etcd/pki/etcd-key.pem
    ---
    vi /etc/systemd/system/etcd.service
    ---
    fix data-dir
    ---
    chown -R etcd:etcd /var/lib/etcd-data-new
    ---
    systemctl daemon-reload
    ---
    systemctl restart etcd
    ```