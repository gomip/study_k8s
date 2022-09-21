1. We have deployed a number of PODs. They are labelled with tier, env and bu. How many PODs exist in the "dev" environment (env)?
```
k get pods --selector env=dev
```
2. How many PODs are in the "finance" business unit (bu)?
```
k get pods --selector bu=finance
```
3. How many objects are in the prod environment including PODs, ReplicaSets and any other objects?
```
k get all --selector env=prod
```
4. dentify the POD which is part of the prod environment, the finance BU and of frontend tier?
```
k get pod --selector env=prod,bu=finance,tier=frontend
```
5. A ReplicaSet definition file is given replicaset-definition-1.yaml. Try to create the replicaset. There is an issue with the file. Try to fix it.
```
vi replicaset-definition-1.yaml
---
tier: front-end
---
k create -f replicaset-definition-1.yaml
```