1. How many Secrets exist on the system?
    ```
    k get secret
    ```
2. How many secrets are defined in the default-token secret?
    ```
    k describe secret default-token-brjcp
    ```
3. What is the type of the default-token secret?
    ```
    k get secret
    ```
4. Which of the following is not a secret data defined in default-token secret?
    ```
    k describe secret default-token-brjcp
    ```
5. We are going to deploy an application with the below architecture   
We have already deployed the required pods and services. Check out the pods and services created.
6. The reason the application is failed is because we have not created the secrets yet. Create a new secret named db-secret with the data given below.
    ```
    cat > secret.yaml
    ---
    echo -n 'sql01' | base64 && echo -n 'root' | base64 && echo -n 'password123' | base64
    ---
    apiVersion: v1
    kind: Secret
    metadata:
      name: db-secret
    data:
      DB_Host: c3FsMDE=
      DB_User: cm9vdA==
      DB_Password: cGFzc3dvcmQxMjM=
    ---
    k apply -f secret.yaml
    ```
7. Configure webapp-pod to load environment variables from the newly created secret.   
Delete and recreate the pod if required.
    ```
    k delete webapp-pod
    ---
    k get pod webapp-pod -o yaml > pod.yaml
    ---
    envFrom:
      - secretRef:
        name: db-secret
    --- 
    k apply -f pod.yaml
    ```
8. View the web application to verify it can successfully connect to the database