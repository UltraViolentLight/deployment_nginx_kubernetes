WAITTIME=300

# deploy network
./scripts/create.sh capstone-network ./infrastructure/network.yaml ./infrastructure/parameter/network-parameters.json
sleep $WAITTIME

# deploy cluster
./scripts/create.sh capstone-cluster ./infrastructure/cluster.yaml ./infrastructure/parameter/cluster-parameters.json  
sleep $WAITTIME

# deploy worker
./scripts/create.sh capstone-worker ./infrastructure/worker.yaml ./infrastructure/parameter/worker-parameters.json  