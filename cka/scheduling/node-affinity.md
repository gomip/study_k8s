1. How many Labels exist on node node01?
```
k describe node node01
```
2. What is the value set to the label key beta.kubernetes.io/arch on node01?
```
k describe node node01
```
3. Apply a label color=blue to node node01
```
k label node node01 color=blue
```
4. Create a new deployment named blue with the nginx image and 3 replicas.
```
k create deploy blue --image=nginx --replicas=3
```
5. Which nodes can the pods for the blue deployment be placed on?
```
k get nodes
---
k describe node node01 | grep Taints
---
k describe node controlplane | grep Taints
```
6. Set Node Affinity to the deployment to place the pods on node01 only.
```
k edit deploy blue
---
      affinity:
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: color
                operator: In
                values:
                - blue
---
```
7. Which nodes are the pods placed on now?
```
k describe pod blue
```
8. Create a new deployment named red with the nginx image and 2 replicas, and ensure it gets placed on the controlplane node only.   
Use the label key - node-role.kubernetes.io/master - which is already set on the controlplane node.
```
k create deploy red --image=nginx --replicas=2 --dry-run=client -o yaml > deploy.yaml
---
vi deploy.yaml
---
      affinity:
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: node-role.kubernetes.io/master
                operator: Exists
---
k apply -f deploy.yaml
```
