#!/bin/bash

# script to depoy a project specific cloud formation config for network, cluster and worker

WAITTIME=300

# deploy network
./scripts/create.sh capstone-network ./infrastructure/network.yaml ./infrastructure/parameter/network-parameters.json
sleep $WAITTIME

# deploy cluster
./scripts/create.sh capstone-cluster ./infrastructure/cluster.yaml ./infrastructure/parameter/cluster-parameters.json  
sleep $WAITTIME

# deploy worker
./scripts/create.sh capstone-worker ./infrastructure/worker.yaml ./infrastructure/parameter/worker-parameters.json  

./scripts/update.sh capstone-worker ./infrastructure/worker.yaml ./infrastructure/parameter/worker-parameters.json  


aws cloudformation update-stack --stack-name $1 --template-body file://$2  --parameters file://$3 --capabilities "CAPABILITY_IAM" --region=us-west-2