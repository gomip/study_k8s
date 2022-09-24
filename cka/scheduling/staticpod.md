1. How many static pods exist in this cluster in all namespaces?
```
k get pods --all-namespaces
```
2. Which of the below components is NOT deployed as a static pod?
```
k get pods --all-namespaces
```
3. Which of the below components is NOT deployed as a static POD?
```
k get pods --all-namespaces
```
4. On which nodes are the static pods created currently?
```
k get pods --all-namespaces
```
5. What is the path of the directory holding the static pod definition files?
```
...? 그냥 Manifest인가
```
6. How many pod definition files are present in the manifests folder?
```
cd /etc/kubernetes/manifests
```
7. What is the docker image used to deploy the kube-api server as a static pod?
```
 k describe pod kube-apiserver-controlplane -n kube-system | grep Image
```
8. Create a static pod named static-busybox that uses the busybox image and the command sleep 1000
```
cd /etc/kubernetes/manifests
---
cat > static-busybox.yaml
---
apiVersion: v1
kind: Pod
metadata:
  name: static-busybox
spec:
  containers:
  - name: static-busybox
    image: busybox
    command: ['sh', '-c' , 'sleep 1000']
---
or

k run static-busybox --image=busybox -o yaml --dry-run=client > busy.yaml
---
add command
```
9. Edit the image on the static pod to use busybox:1.28.4
```
vi busy.yaml
---
fix version
---
k delete pod kube-apiserver-controlplane -n kube-system
```
10. We just created a new static pod named static-greenbox. Find it and delete it.   
This question is a bit tricky. But if you use the knowledge you gained in the previous questions in this lab, you should be able to find the answer to it.
```
k get node -o wide
---
ssh IP
--- 
grep /usr/bin/kubelet
---
cd /var/lib/kubelet
---
cat config.yaml
staticPath = /etc/just-to-mess-with-you
---
cd /etc/just-to-mess-with-you
rm -rf greenbox.yaml
```