1. A pod definition file nginx.yaml is given. Create a pod using the file.
```
k create -f nginx.yaml
```
2. What is the status of the created POD?
```
k get pods
```
3. Why is the POD in a pending state?   
Inspect the environment for various kubernetes control plane components.
```
k describe pods nginx
```
4. Manually schedule the pod on node01.    
Delete and recreate the POD if necessary.
```
k delete pod nginx
---
vi nginx.yaml
---
nodeName: node01
---
k create -f nginx.yaml
```
5. Now schedule the same pod on the controlplane node.   
Delete and recreate the POD if necessary.
```
k delete pod nginx
---
vi nginx.yaml
---
nodeName: controlPlane
---
k create -f nginx.yaml
```