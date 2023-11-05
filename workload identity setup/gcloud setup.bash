gcloud iam service-accounts create GSA_NAME   
    --project=PROJECT_ID
gcloud projects add-iam-policy-binding PROJECT_ID
    --member "serviceAccount:GSA_NAME@PROJECT_ID.iam.gserviceaccount.com" --role "ROLE_NAME"

---

gcloud container clusters update CLUSTER_NAME
    --region=COMPUTE_REGION
    --workload-pool=PROJECT_ID.svc.id.goog
gcloud container node pools update NODEPOOL_NAME
    --cluster=CLUSTER_NAME
    --region=COMPUTE_REGION
    --workload-metadata=GKE_METADATA
gcloud container clusters get-credentials CLUSTER_NAME
    --region=COMPUTE_REGION
kubectl create namespace NAMESPACE
kubectl create serviceaccount KSA_NAME
    --namespace NAMESPACE
gcloud iam service-accounts add-iam-policy-binding
    --role="roles/iam.workloadIdentityUser"
    --member="serviceAccount:PROJECT_ID.svc.id.goog[NAMESPACE/KSA_NAME]"
    GSA_NAME@PROJECT_ID.iam.gserviceaccount.com
kubectl annotate serviceaccount KSA_NAME
    --namespace NAMESPACE
    iam.gke.io/gcp-service-account=GSA_NAME@PROJECT_ID.iam.gserviceaccount.com