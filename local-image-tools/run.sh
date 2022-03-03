#!/usr/bin/env bash


CROND_PID=$(ps -ef | grep cron | grep -Ev 'grep|tini' | awk '{print $2}')

NODE_NAME=$(kubectl get nodes -owide  | grep $NODE_IP | awk '{print $1}')

kubectl get pods -A -owide | grep $NODE_NAME | awk '{print "kubectl -n "$1" get pods "$2" -ojson | jq .spec.containers"}' | bash | grep '"image":' >> imgs

sed -i 's?    "image": "??g' imgs
sed -i 's?",??g' imgs

#images=$(kubectl get pods -A -owide | grep $NODE_NAME | awk '{print "kubectl -n "$1" get pods "$2" -o yaml "}' | bash | grep 'image:' | sed 's?  - image:??g' | sed 's?    image:??g' | grep $REGISTRY_IP)
images=$(cat imgs | grep $REGISTRY_IP)
docker login $REGISTRY_IP -u $REGISTRY_USERNAME -p $REGISTRY_PASSWORD
for image in $images
do
  DATE=$(date +'%Y-%m-%d %H:%M:%S')
  docker push $image > /dev/null
  echo "$DATE docker push $image" >/proc/${CROND_PID}/fd/1 2>/proc/${CROND_PID}/fd/2
done

rm -rf imgs

docker rmi $(docker images -f "dangling=true" -q) -f

docker images | awk '{print "docker rmi "$1":"$2}' | bash