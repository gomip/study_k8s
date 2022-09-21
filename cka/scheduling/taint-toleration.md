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
  - key: "spray"
    value: "mortein"
    operator: "Equal"
    effect: "NoSchedule"

---
k apply -f pod.yaml
```
8. check node of pod bee
```
k describe pods bee
```
9. Do you see any taints on controlplane node?
```
NoSchedule
```
10. Remove the taint on controlplane, which currently has the taint effect of NoSchedule.
```
k edit node controlplane
---
remove taint
```
11. What is the state of the pod mosquito now?
```
k get pods
```
12. Which node is the POD mosquito on now?
```
k describe pods mosquito
```