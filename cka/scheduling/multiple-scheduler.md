1. What is the name of the POD that deploys the default kubernetes scheduler in this environment?
```
k get pods --all-namespaces
```
2. What is the image used to deploy the kubernetes scheduler?
```
k describe pods kube-scheduler-controlplane -n kube-system | grep Image
```
3. We have already created the ServiceAccount and ClusterRoleBinding that our custom scheduler will make use of.   
Checkout the following Kubernetes objects:   
- ServiceAccount: my-scheduler (kube-system namespace)
- ClusterRoleBinding: my-scheduler-as-kube-scheduler
- ClusterRoleBinding: my-scheduler-as-volume-scheduler   
Run the command: kubectl get serviceaccount -n kube-system & kubectl get clusterrolebinding
```
kubectl get serviceaccount -n kube-system & kubectl get clusterrolebinding
```
4. Let's create a configmap that the new scheduler will employ using the concept of ConfigMap as a volume.   
Create a configmap with name my-scheduler-config using the content of file /root/my-scheduler-config.yaml
```
k create -n kube-system cm my-scheduler-config --from-file=/root/my-scheduler-config.yaml
```
5. Deploy an additional scheduler to the cluster following the given specification.   
Use the manifest file provided at /root/my-scheduler.yaml. Use the same image as used by the default kubernetes scheduler.
```
vi my-scheduler.yaml
---
  image: k8s.gcr.io/kube-scheduler:v1.23.0 
---
k apply -f my-scheduler.yaml
```
6. A POD definition file is given. Use it to create a POD with the new custom scheduler.   
File is located at /root/nginx-pod.yaml
```
vi nginx-pod.yaml
---
schedulerName: my-scheduler
---
k apply -f nginx-pod.yaml
```