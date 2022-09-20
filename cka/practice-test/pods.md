1. How many pods exist on the system?
```
k get pods
```
2. Create a new pod with the nginx image.
```
k run nginx --image=nginx
```
3. How many pods are created now?
```
k get pods 
```
4. What is the image used to create the new pods?
```
k describe pods newpods-k2hn4
```
5. Which nodes are these pods placed on?
```
k describe pods newpods-k2hn4
```
6. How many containers are part of the pod webapp?
```
k describe pods webapp
```
7. What images are used in the new webapp pod?
```
k describe pods webapp
```
8. What is the state of the container agentx in the pod webapp?   
Wait for it to finish the ContainerCreating state
```
k describe pods webapp
```
9. Why do you think the container agentx in pod webapp is in error?
```
image not exists
```
10. What does the READY column in the output of the kubectl get pods command indicate?
```
k get pods
---
running / total
```
11. Delete the webapp Pod.
```
k delete pod webapp
```
12. Create a new pod with the name redis and with the image redis123.   
Use a pod-definition YAML file. And yes the image name is wrong!
```
cat > redis.yaml
---
apiVersion: v1
kind: Pod
metadata:
  name: redis
spec:
  containers:
  - name: redis
    image: redis123

---
k apply -f redis.yaml
```
13. Now change the image on this pod to redis.   
Once done, the pod should be in a running state.
```
k edit pod redis 
```