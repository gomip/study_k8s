1. Let us explore the environment first. How many nodes do you see in the cluster?
    ```
    k get nodes
    ```
2. How many applications do you see hosted on the cluster?
    ```
    k get deploy
    ```
3. Which nodes are the applications hosted on?
    ```
    k get pod -o wide
    ```
4. We need to take node01 out for maintenance. Empty the node of all applications and mark it unschedulable.
    ```
    k cordon node01
    ---
    k drain node01 --ignore-daemonsets
    ```
5. What nodes are the apps on now?
    ```
    k get pod -o wide
    ```
6. The maintenance tasks have been completed. Configure the node node01 to be schedulable again.
    ```
    k uncordon node01
    ```
7. How many pods are scheduled on node01 now?
    ```
    0
    ```
8. Why are there no pods on node01?
    ```
    new pods need to be scheduled
    ```
9. Why are the pods placed on the controlplane node?
    ```
    no taints
    ```
10. Time travelling to the next maintenance window…
    
11. We need to carry out a maintenance activity on node01 again. Try draining the node again using the same command as before: kubectl drain node01 --ignore-daemonsets
    ```
    No
    ```
12. Why did the drain command fail on node01? It worked the first time!
    ```
    there is a pod not controlled by replica set
    ```
13. What is the name of the POD hosted on node01 that is not part of a replicaset?
    ```
    k get pod -o wide
    ```
14. What would happen to hr-app if node01 is drained forcefully?
    ```
    will be lost forever
    ```
15. Oops! We did not want to do that! hr-app is a critical application that should not be destroyed. We have now reverted back to the previous state and re-deployed hr-app as a deployment.
    
16. hr-app is a critical app and we do not want it to be removed and we do not want to schedule any more pods on node01.
Mark node01 as unschedulable so that no new pods are scheduled on this node.   
Make sure that hr-app is not affected.
    ```
    k cordon node01
    ```
