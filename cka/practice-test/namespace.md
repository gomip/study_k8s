1. How many Namespaces exist on the system?
```
k get ns
```
2. How many pods exist in the research namespace?
```
k get pods -n research
```
3. Create a POD in the finance namespace.   
Use the spec given below.
```
k run redis --image=redis -n finance
```
4. Which namespace has the blue pod in it?
```
k get pods --all-namespaces | grep blue
``` 
6. What DNS name should the Blue application use to access the database db-service in its own namespace - marketing?   
You can try it in the web application UI. Use port 6379.
```
k get svc -n marketing
---
they are in same namespace
```
7. What DNS name should the Blue application use to access the database db-service in the dev namespace?   
You can try it in the web application UI. Use port 6379.
```
db-service.dev.svc.cluster.local
```