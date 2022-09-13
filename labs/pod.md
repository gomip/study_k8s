1. How many pods exist on the system?   
```
kubectl get pods
```
2. create pod with nginx
```
cat nginx.yaml
---
apiVersion: v1
kind: Pod
metadata: 
  name: nginx
spec:
  containers:
  - name: nginx
    image: nginx
---
kubectl apply -f nginx.yaml
---
solution
kubectl run nginx --image=nginx
```
3. How many pods are created now?   
```
kubectl get pods
```
4. What is the image used to create the new pods?
```
kubectl describe pods newpods-7fshp
```
5. Which nodes are these pods placed on?
```
kubectl describe pods newpods-7fshp
---
solution
kubectl get pods -o wide
```
6. How many containers are part of the pod webapp?
```
kubectl describe pods webapp
```
7. What images are used in the new webapp pod?
```
kubectl describe pods webapp | grep Image
```
8. What is the state of the container agentx in the pod webapp?
```
kubectl describe pods webapp 
```
9. Why do you think the container agentx in pod webapp is in error?
```
kubectl describe pods webapp
```
10. What does the READY column in the output of the kubectl get pods command indicate?
```
running / total
```
11. delete the webapp pods
```
kubectl delete pods webapp
```
12. Create a new pod with the name redis and with the image redis123.
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
kubectl apply -f redis.yaml
---
solution
kubectl run redis --image=redis123 --dry-run=client -o yaml > redis.yaml
kubectl create -f redis.yaml
```
13. Now change the image on this pod to redis.
```
vi redis.yaml
---
apiVersion: v1
kind: Pod
metadata:
  name: redis
spec:
  containers:
  - name: redis
    image: redis
---
kubectl apply -f redis.yaml
```