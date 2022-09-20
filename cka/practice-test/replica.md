1. How many PODs exist on the system?
```
k get pods
```
2. How many ReplicaSets exist on the system?
```
k get rs
```
3. How about now? How many ReplicaSets do you see?
```
k get rs
```
4. How many PODs are DESIRED in the new-replica-set?
```
k get rs
```
5. What is the image used to create the pods in the new-replica-set?
```
k describe rs new-replica-set
```
6. How many PODs are READY in the new-replica-set?
```
k get rs
```
7. Why do you think the PODs are not ready?
```
image not exists
```
8. Delete any one of the 4 PODs.
```
k get pods
---
k delete pods new-replica-set-kzzfq
```
9. how many pod now exists
```
k get pods
```
10. Why are there still 4 PODs, even after you deleted one?
```
replica set ensures that desired number of pods
```
11. Create a ReplicaSet using the replicaset-definition-1.yaml file located at /root/.
```
vi replicaset-definition-1.yaml
---
v1 -> apps/v1
---
k create -f replicaset-definition-1.yaml
```
12. Fix the issue in the replicaset-definition-2.yaml file and create a ReplicaSet using it.
```
vi replicaset-definition-2.yaml
---
tier: frontend
---
k create -f replicaset-definition-2.yaml
```
13. Delete the two newly created ReplicaSets - replicaset-1 and replicaset-2
```
k delete rs replicaset-1
k delete rs replicaset-2
```
14. Fix the original replica set new-replica-set to use the correct busybox image.   
Either delete and recreate the ReplicaSet or Update the existing ReplicaSet and then delete all PODs, so new ones with the correct image will be created.
```
k edit rs new-replica-set
---
k delete pods --all
```
15. Scale the ReplicaSet to 5 PODs.   
Use kubectl scale command or edit the replicaset using kubectl edit replicaset.
```
k scale --replicas=5 rs new-replica-set
```
16. Now scale the ReplicaSet down to 2 PODs.   
Use the kubectl scale command or edit the replicaset using kubectl edit replicaset.
```
k scale --replicas=2 rs new-replica-set
```