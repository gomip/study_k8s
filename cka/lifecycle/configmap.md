1. How many PODs exist on the system?
    ```
    k get pods
    ```
2. What is the environment variable name set on the container in the pod?
    ```
    k describe webapp-color
    ```
3. What is the value set on the environment variable APP_COLOR on the container in the pod?
    ```
    k describe webapp-color
    ```
4. View the web application UI by clicking on the Webapp Color Tab above your terminal.
5. Update the environment variable on the POD to display a green background
    ```
    k get pod webapp-color -o yaml > pod.yaml
    ---
    vi pod.yaml
    ---
    APP_COLOR: green
    ---
    k delete pod webapp-color && k apply -f pod.yaml
    ```
6. View the changes to the web application UI by clicking on the Webapp Color Tab above your terminal.
7. How many ConfigMaps exists in the default namespace?
    ```
    k get cm
    ```
8. Identify the database host from the config map db-config
    ```
    k describe cm db-config
    ```
9. Create a new ConfigMap for the webapp-color POD. Use the spec given below.
    ```
    k create cm webapp-config-map --from-literal=APP_COLOR=darkblue
    ```
10. Update the environment variable on the POD to use the newly created ConfigMap   
Note: Delete and recreate the POD. Only make the necessary changes. Do not modify the name of the Pod.
    ```
    vi pod.yaml
    ---
    env:
      name: APP_COLOR
      valueFrom:
        configMapKeyRef:
          name: webapp-config-map
          key: APP_COLOR
    ---
    k delete pod webapp-color && k apply -f pod.yaml
    ```
11. View the changes to the web application UI by clicking on the Webapp Color Tab above your terminal.