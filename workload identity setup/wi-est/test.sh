#!/bin/bash

POD_NAME="workload-identity-test"
NAMESPACE=""

kubectl apply -f $POD_NAME
kubectl exec --namespace $NAMESPACE -it $POD_NAME -- /bin/bash
curl -H "Metadata-Flavor: Google" http://169.254.169.254/computeMetadata/v1/instance/service-accounts/default/email
