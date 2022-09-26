1. How many PODs exist on the system?
    ```
    k get pods
    ```
2. What is the command used to run the pod ubuntu-sleeper?
    ```
    k describe pod ubuntu-sleeper
    ```
3. Create a pod with the ubuntu image to run a container to sleep for 5000 seconds. Modify the file ubuntu-sleeper-2.yaml.
    ```
    vi ubuntu-sleeper-2.yaml
    ---
    command: ["sleep"]
    args: ["5000"]
    ---
    k apply -f ubuntu-sleeper-2.yaml
    ```
4. Create a pod using the file named ubuntu-sleeper-3.yaml. There is something wrong with it. Try to fix it!
    ```
    vi ubuntu-sleeper-3.yaml
    ---
    command: ["sleep", "1200"]
    ---
    k apply -f ubuntu-sleeper-3.yaml
    ```
5. Update pod ubuntu-sleeper-3 to sleep for 2000 seconds.
    ```
    vi ubuntu-sleepr-3.yaml
    ---
    command: ["sleep", "2000"]
    ---
    k apply -f ubuntu-sleeper-3.yaml
    ```
6. Inspect the file Dockerfile given at /root/webapp-color directory. What command is run at container startup?
    ```
    cd webapp-color && cat Dockerfile
    ```
7. Inspect the file Dockerfile2 given at /root/webapp-color directory. What command is run at container startup?
    ```
    cd webapp-color && cat Dockerfile2
    ```
8. Inspect the two files under directory webapp-color-2. What command is run at container startup?
    ```
    cd webapp-color-2
    ---
    cat Dockerfile2
    --- 
    cat webapp-color-pod-2.yaml
    ```
9. Inspect the two files under directory webapp-color-3. What command is run at container startup?
    ```
    cd webapp-color-3
    ---
    cat Dockerfile2
    --- 
    cat webapp-color-pod-2.yaml
    ```
10. Create a pod with the given specifications. By default it displays a blue background. Set the given command line arguments to change it to green
    ```
    k run webapp-green --image=kodekloud/webapp-color -o yaml --dry-run=client > temp.yaml
    ---
    vi temp.yaml
    ---
    args: ["--color", "green"]
    ---
    k apply -f temp.yaml
    ```