1. We have deployed a few PODs running workloads. Inspect them.
```
k get pods --all-namespaces
```
2. Let us deploy metrics-server to monitor the PODs and Nodes. Pull the git repository for the deployment files.
```
git clone https://github.com/kodekloudhub/kubernetes-metrics-server.git
```
3. Deploy the metrics-server by creating all the components downloaded.   
Run the kubectl create -f . command from within the downloaded repository.
```
cd kubernetes-metrics-server
---
k create -f .
```
4. It takes a few minutes for the metrics server to start gathering data.
```
k top node
```
5. Identify the node that consumes the most CPU.
```
k top node 
```
6. Identify the node that consumes the most Memory.
```
k top node
```
7. Identify the POD that consumes the most Memory.
```
k top pod
```
8. Identify the POD that consumes the least CPU.
```
k top pod
```