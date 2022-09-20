2. Deploy a pod named nginx-pod using the nginx:alpine image.   
Use imperative commands only.
```
k run nginx-pod --image=nginx:alpine
```
3. Deploy a redis pod using the redis:alpine image with the labels set to tier=db.   
Either use imperative commands to create the pod with the labels. Or else use imperative commands to generate the pod definition file, then add the labels before creating the pod using the file.
```
k run redis --image=redis:alpine --dry-run=client -o yaml
---
labels:
  tier: db
```
4. Create a service redis-service to expose the redis application within the cluster on port 6379.   
Use imperative commands.
```
k create svc clusterip redis-service --tcp=6379:6379
```
5. Create a deployment named webapp using the image kodekloud/webapp-color with 3 replicas.   
Try to use imperative commands only. Do not create definition files.
```
k create deploy webapp --image=kodekloud/webapp-color --replicas=3
```
6. Create a new pod called custom-nginx using the nginx image and expose it on container port 8080.
```
k run custom-nginx --image=nginx --port=8080
```
7. Create a new namespace called dev-ns.
```
k create ns dev-ns
```
8. Create a new deployment called redis-deploy in the dev-ns namespace with the redis image. It should have 2 replicas.   
Use imperative commands.
```
k create deploy redis-deploy -n dev-ns --image=redis --replicas=2
```
9. Create a pod called httpd using the image httpd:alpine in the default namespace. Next, create a service of type ClusterIP by the same name (httpd). The target port for the service should be 80.   
Try to do this with as few steps as possible.
```
k run httpd --image=httpd:alpine
---
k expose pod httpd --port=80 

> answer : 아래처럼 해도된다
k run httpd --image=httpd:alpine --port=80 --expose=true

```