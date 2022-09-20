1. How many PODs exist on the system?
```
k get pods
```
2. How many ReplicaSets exist on the system?
```
k get rs
```
3. How many Deployments exist on the system?
```
k get deploy
```
4.  How many Deployments exist on the system?
```
k get deploy
```
5. How many ReplicaSets exist on the system now?
```
k get rs
```
6. How many PODs exist on the system now?
```
k get pods
```
7. Out of all the existing PODs, how many are ready?
```
0
```
8. What is the image used to create the pods in the new deployment?
```
k describe deploy frontend-deployment
```
9. Why do you think the deployment is not ready?
```
image busybox888 does not exists
``` 
10. Create a new Deployment using the deployment-definition-1.yaml file located at /root/.
```
vi deployment-definition-1.yaml
---
kind: deployment -> Deployment
image: busybox888 -> busybox
---
k apply -f deployment-definition-1.yaml
```
11. Create a new Deployment with the below attributes using your own deployment definition file.   
Name: httpd-frontend;   
Replicas: 3;   
Image: httpd:2.4-alpine   
```
cat > deploy.yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: httpd-frontend
  labels:
    app: myapp
spec:
  selector:
    matchLabels:
      app: myapp
  replicas: 3
  template:
    metadata:
      name: httpd
      labels:
        app: myapp
    spec:
      containers:
      - name: httpd
        image: httpd:2.4-alpine
---
k apply -f deploy.yaml
```