1. Identify the pod that has an initContainer configured.
    ```
    k get pods
    ---
    k describe pod blue
    ```
2. What is the image used by the initContainer on the blue pod?
    ```
    k describe pod blue
    ```
3. What is the state of the initContainer on pod blue?
    ```
    k describe pod blue
    ```
4. Why is the initContainer terminated? What is the reason?
    ```
    process completed
    ```
5. We just created a new app named purple. How many initContainers does it have?
    ```
    k describe pod purple | grep Init
    ```
6. What is the state of the POD?
    ```
    k describe pod purple
    ```
7. How long after the creation of the POD will the application come up and be available to users?
    ```
    k describe pod purple
    600 + 1200 => 30min
    ```
8. Update the pod red to use an initContainer that uses the busybox image and sleeps for 20 seconds
    ```
    k get pod red -o yaml > red.yaml && vi red.yaml
    ---
    initContainers:
    - image: busybox
      name: busybox
      command: ["sleep", "20"]
    ```
9. A new application orange is deployed. There is something wrong with it. Identify and fix the issue.
    ```
    k get pod orange -o yaml > orange.yaml && vi orange.yaml
    ---
    sleep 2
    ---
    k delete pod orange
    ---
    k apply -f orange.yaml
    ```