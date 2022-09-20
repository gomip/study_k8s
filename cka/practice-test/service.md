1. How many Services exist on the system?
```
k get svc
```
3. What is the type of the default kubernetes service?
```
k describe svc kubernetes
```
4. What is the targetPort configured on the kubernetes service?
```
k describe svc kubernetes
```
5. How many labels are configured on the kubernetes service?
```
k describe svc kubernetes
```
6. How many Endpoints are attached on the kubernetes service?
```
k describe svc kubernetes
```
7. How many Deployments exist on the system
```
k get deploy
```
8. What is the image used to create the pods in the deployment?
```
k describe deploy simple-webapp-deployment
```
9. Are you able to accesss the Web App UI?
```
No
```
10. Create a new service to access the web application using the service-definition-1.yaml file.

```
Name: webapp-service
Type: NodePort
targetPort: 8080
port: 8080
nodePort: 30080
selector:
  name: simple-webapp
```
```
vi service-definition-1.yaml
---
apiVersion: v1
kind: Service
metadata:
  name: webapp-service
spec:
  type: NodePort
  ports:
    - targetPort: 8080
      port: 8080
      nodePort: 30080
  selector:
    name: simple-webapp
---
k apply -f service-definition-1.yaml
```
