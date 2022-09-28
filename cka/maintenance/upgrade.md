1. What is the current version of the cluster?
    ```
    k get nodes
    ```
2. How many nodes are part of this cluster?
    ```
    k get nodes
    ```
3. How many nodes can host workloads in this cluster?
    ```
    kubectl describe node01 
    kubectrl describe controlplane
    ```
4. How many applications are hosted on the cluster?
    ```
    kubectl get deploy
    ```
5. What nodes are the pods hosted on?
    ```
    kubectl get pod -o wide
    ```
6. You are tasked to upgrade the cluster. User's accessing the applications must not be impacted. And you cannot provision new VMs. What strategy would you use to upgrade the cluster?
    ```
    upgrade one at a time
    ```
7. What is the latest stable version available for upgrade?
    ```
    kubeadm upgrade plan
    ```
8. We will be upgrading the master node first. Drain the master node of workloads and mark it UnSchedulable
    ```
    kubectl drain controlplane --ignore-daemonsets
    ```
9. Upgrade the controlplane components to exact version v1.20.0
    ```
    apt install kubeadm=1.20.0-00
    ---
    kubeadm upgrade apply v1.20.0
    ---
    apt install kubelet=1.20.0-00 
    ---
    systemctl restart kubelet
    ```
10. Mark the controlplane node as "Schedulable" again
    ```
    kubectl uncordon controlplane
    ```
11. Next is the worker node. Drain the worker node of the workloads and mark it UnSchedulable
    ```
    kubectl drain node01 --ignore-daemonsets
    ```
12. Upgrade the worker node to the exact version v1.20.0
    ```
    ssh node01
    ---
    apt install kubeadm=1.20.0-00
    ---
    kubeadm upgrade apply v1.20.0
    ---
    apt install kubelet=1.20.0-00 
    ---
    systemctl restart kubelet
    ```
13. Mark the controlplane node as "Schedulable" again
    ```
    kubectl uncordon node01
    ```