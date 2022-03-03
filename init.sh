#!/usr/bin/env sh

sed -i "s?K8S_SERVER?$K8S_SERVER?g" /.kube/config
sed -i "s?K8S_NAMESPACE?$K8S_NAMESPACE?g" /.kube/config
sed -i "s?K8S_TOKEN?$K8S_TOKEN?g" /.kube/config

env >> /etc/environment

exec $@

# K8S_TOKEN="eyJhbGciOiJSUzI1NiIsImtpZCI6ImRubm1RaEdmWmNPTGhsdzUwWDdOTUhadWJvRUdzZ05vcXNrajNsS3VUaHMifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlLXN5c3RlbSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJkY2UtYWRtaW4tdG9rZW4tODY1OHoiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoiZGNlLWFkbWluIiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZXJ2aWNlLWFjY291bnQudWlkIjoiMDdiN2IwMTktMTExZi00N2FhLWJhNzctNDBmY2E1ZDQwZDNiIiwic3ViIjoic3lzdGVtOnNlcnZpY2VhY2NvdW50Omt1YmUtc3lzdGVtOmRjZS1hZG1pbiJ9.uFsN757Md6MpLerItJ7Mc_giEk6cuadT39UcNQmTGJFnOqdmMTEUgPlYioBMLzFvesIdng1mWoIaVUv9TKnjjKd5s4omcC_c6RTtc5DXEa8fxjOkdQlguDkCzhNPg2Mp1orhyhorwRktxiuuEOUvo46y3E60oC2u4X66Y_KGEuInYP4Gc6FixeNqkuSSVmf-hQItY0QYVW3hWLoHam5btT1NtaG6krTX-m-DKMbuBZPBYNtXNZsykEimm_STYHWcUSIGgrW__4FcP3MqexoOTfWTP5u5fwxbxBwEikS0-0n9OvHAZyplI5UPZW-x3L4SQdTHm6lkf_BRVuqm9GA0KA"
# K8S_SERVER="https://192.168.101.10:16443"
# K8S_NAMESPACE="default"
# REGISTRY_IP="192.168.101.9"
# REGISTRY_USERNAME="admin"
# REGISTRY_PASSWORD="changeme"
# NODE_NAME=$(hostname)

# docker run -d  --name cron -e NODE_NAME=$NODE_NAME -e K8S_TOKEN=$K8S_TOKEN -e K8S_SERVER=$K8S_SERVER -e K8S_NAMESPACE=$K8S_NAMESPACE \
# -e REGISTRY_IP=$REGISTRY_IP -e REGISTRY_USERNAME=$REGISTRY_USERNAME -e REGISTRY_PASSWORD=$REGISTRY_PASSWORD \
# -v /usr/bin/docker:/usr/bin/docker -v /var/run/docker.sock:/var/run/docker.sock \
# cron:v0.0.2