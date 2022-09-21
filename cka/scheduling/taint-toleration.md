1. How many nodes exist on the system?
```
k get nodes
```
2. Do any taints exist on node01 node?
```
k describe node node01
```
3. Create a taint on node01 with key of spray, value of mortein and effect of NoSchedule
```
k taint nodes node01 spray=mortein:NoSchedule
```
4. Create a new pod with the nginx image and pod name as mosquito.
```
k run mosquito --image=nginx
```
5. What is the state of the POD?
```
k get pods
```
6. Why do you think the pod is in a pending state?
```
tolerate
```
7. Create another pod named bee with the nginx image, which has a toleration set to the taint mortein.
```
cat > pod.yaml
---
apiVersion: v1
kind: Pod
metadata:
  name: bee
spec:
  containers:
  - name: nginx
    image: nginx
  tolerations:

```
8. 
9. 
10. 
11. 
12. 