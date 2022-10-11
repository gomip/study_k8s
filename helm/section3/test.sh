# 1. helm install tomcat
helm install tomcat bitnami/tomcat

# 2. get Password : ozKlYK79yE
echo Password: $(kubectl get secret --namespace default tomcat -o jsonpath="{.data.tomcat-password}" | base64 -d)

# 3. Upgrade password and service
# values.yaml
# tomcatPassword: ozKlYK79yE
# service:
#   type: NodePort
#   nodePorts:
#     http: 31111
helm upgrade tomcat bitnami/tomcat --values ./values.yaml

# 4. delete
helm uninstall tomcat