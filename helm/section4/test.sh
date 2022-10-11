# 1. Generate name
helm install bitnami/tomcat --generate-name --name-template="test-{{randAlpha 5 | lower }}" 
# 2. dry-run
helm install bitnami/tomcat --generate-name --name-template="test-{{randAlpha 5 | lower }}" --dry-run
# 3. Templates
helm template test-wwjit bitnami/tomcat
# 4. get release notes
helm get notes test-wwjit
# 5. get release records
k get secret
helm history