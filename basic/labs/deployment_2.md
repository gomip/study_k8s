1. We have deployed a simple web application. Inspect the PODs and the Services
```
k get pods
```
2. What is the current color of the web application?
```
blue
```
3. Run the script named curl-test.sh to send multiple requests to test the web application. Take a note of the output.
```
./curl-test.sh
Hello, Application Version: v1 ; Color: blue OK
```
4. Inspect the deployment and identify the number of PODs deployed by it
```
k get deploy
```
5. What container image is used to deploy the applications?
```
k describe deploy frontend
```
6. Inspect the deployment and identify the current strategy
```
k describe deploy frontend
```
7. If you were to upgrade the application now what would happen?
```
Pods are upgraded few at a time
```
8. Let us try that. Upgrade the application by setting the image on the deployment to kodekloud/webapp-color:v2
```
k edit deploy frontend
```
9. Run the script curl-test.sh again. Notice the requests now hit both the old and newer versions. However none of them fail.
```
./curl-test.sh
```
10. Up to how many PODs can be down for upgrade at a time
```
k describe deploy frontend
```
11. Change the deployment strategy to Recreate
```
k edit deploy frontend 
---
strategy > 전부 삭제 > type: Recreate
```
12. Upgrade the application by setting the image on the deployment to kodekloud/webapp-color:v3
```
k set image deploy frontend webapp-color=kodekloud/webapp-color:v3
```
13. Run the script curl-test.sh again. Notice the failures. Wait for the new application to be ready. Notice that the requests now do not hit both the versions
```
./curl-test.sh
```