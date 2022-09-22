1. A pod called rabbit is deployed. Identify the CPU requirements set on the Pod
```
k describe pod rabbit
```
2. Delete the rabbit Pod.
```
k delete pod rabbit
```
3. Another pod called elephant has been deployed in the default namespace. It fails to get to a running state. Inspect this pod and identify the Reason why it is not running.
```
k describe pod elephant
```
4. The status OOMKilled indicates that it is failing because the pod ran out of memory. Identify the memory limit set on the POD.
5. The elephant pod runs a process that consume 15Mi of memory. Increase the limit of the elephant pod to 20Mi.   
Delete and recreate the pod if required. Do not modify anything other than the required fields.
```
k get pod elephant -o yaml > elephant.yaml
---
vi elephant.yaml
---
resources:
  limits:
    memory: 20Mi
---
k delete pod elephant
---
k apply -f elephant.yaml
```
6. Inspect the status of POD. Make sure it's running
```
k get pods elephant -o wide
```
7. Delete the elephant Pod.
```
k delete pod elephant
```