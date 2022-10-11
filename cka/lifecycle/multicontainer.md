1. Identify the number of containers created in the red pod.
    ```
    k get pod
    ```
2. Identify the name of the containers running in the blue pod.
    ```
    k describe pod blue
    ```
3. Create a multi-container pod with 2 containers.   
Use the spec given below.   
If the pod goes into the crashloopbackoff then add the command sleep 1000 in the lemon container.
    ```
    k run yellow -o yaml --dry-run=client --image=busybox > pod.yaml
    ---
    vi pod.yaml
    ---
    command: ["sleep", "1000"]
    image: redis
    name: gold          
    --- 
    k apply -f pod.yaml 
    ```
4. We have deployed an application logging stack in the elastic-stack namespace. Inspect it.
5. Once the pod is in a ready state, inspect the Kibana UI using the link above your terminal. There shouldn't be any logs for now.
6. Inspect the app pod and identify the number of containers in it.
    ```
    k get pod -n elastic-stack
    ```
7. The application outputs logs to the file /log/app.log. View the logs and try to identify the user having issues with Login.
    ```
    k exec --stdin --tty app -n elastic-stack -- cat /log/app.log
    ---
    k logs pod app -n elastic-stack
    ```
8. Edit the pod to add a sidecar container to send logs to Elastic Search. Mount the log volume to the sidecar container.   
Only add a new container. Do not modify anything else. Use the spec provided below.
    ```
    Name: app
    Container Name: sidecar
    Container Image: kodekloud/filebeat-configured
    Volume Mount: log-volume
    Mount Path: /var/log/event-simulator/
    Existing Container Name: app
    Existing Container Image: kodekloud/event-simulator
    ```
    ```
    k get pod -o yaml -n elastic-stack > es.yaml
    ---
    vi es.yaml
    ---
    containers:
      - image: kodekloud/filebeat-configured
        name: sidecar
        volumeMounts:
        - mountPath: /var/log/event-simulator/
          name: log-volume
    ---
    k apply -f es.yaml
    ```
9. Inspect the Kibana UI. You should now see logs appearing in the Discover section. (https://bit.ly/2EXYdHf)
