1. How many DaemonSets are created in the cluster in all namespaces?
```
k get ds --all-namespaces
```
2. Which namespace are the DaemonSets created in?
```
k get ds --all-namespaces
```
3. Which of the below is a DaemonSet?
```
k get ds --all-namespaces
```
4. On how many nodes are the pods scheduled by the DaemonSet kube-proxy
```
k describe ds kube-proxy -n kube-system
```
5. What is the image used by the POD deployed by the kube-flannel-ds DaemonSet?
```
k describe ds kube-flannel-ds -n kube-system | grep Image
```
6. Deploy a DaemonSet for FluentD Logging.
```
cat > ds.yaml
---
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: elasticsearch
  namespace: kube-system
spec:
  selector:
    matchLabels:
      app: test
  template:
    metadata:
      labels:
        app: test
    spec:
      containers:
      - name: elasticsearch
        image: k8s.gcr.io/fluentd-elasticsearch:1.20
---
k apply -f ds.yaml
```