1. How many PODs exist on the system?
```
kubectl get pods
```
2. How many ReplicaSets exist on the system?
```
kubectl get replicaset
```
3. How about now? How many ReplicaSets do you see?
```
kubectl get replicaset
```
4. How many PODs are DESIRED in the new-replica-set?
```
kubectl get rs
```
5. What is the image used to create the pods in the new-replica-set?
```
kubectl describe rs new-replica-set
```
6. How many PODs are READY in the new-replica-set?
```
kubectl get rs
```
7. Why do you think the PODs are not ready?
```
no image exists
```
8. Delete any one of the 4 PODs.
```
kubectl get pods
kubectl delete pods new-replica-set-t98qp
```
9. How many PODs exist now?
```
kubectl get pods
```
10. Why are there still 4 PODs, even after you deleted one?
```
replicaset ensured the number of pods
```
11. Create a ReplicaSet using the replicaset-definition-1.yaml file located at /root/.
```
vi replicaset-definition-1.yaml
---
apiVersion: apps/v1
---
kubectl create -f replicaset-definition-1.yaml
```
12. Fix the issue in the replicaset-definition-2.yaml file and create a ReplicaSet using it.
```
vi replicaset-definition-2.yaml
---
tier: nginx
---
kubectl create -f replicaset-definition-2.yaml
```
13. Delete the two newly created ReplicaSets - replicaset-1 and replicaset-2
```
kubectl delete rs replicaset-1 && kubectl delete rs replicaset-2
```
14. Fix the original replica set new-replica-set to use the correct busybox image.
```
kubectl edit rs new-replica-set
---
kubectl delete --all pods
```
15. Scale the ReplicaSet to 5 PODs.
```
kubectl scale --replicas=5 rs new-replica-set
```
16. Now scale the ReplicaSet down to 2 PODs.
```
kubectl scale --replicas=2 rs new-replica-set
```