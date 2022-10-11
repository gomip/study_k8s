helm install tomcat bitnami/tomcat

getPassword
upgrade custom value.yaml

tomcatPassword: 
service:
  type: NodePort
  nodePort: 30007

helm uninstall