
## install helm
https://helm.sh/docs/intro/install/
```bash
sudo dnf install helm
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install \
 cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --set installCRDs=true

# kubectl -n cert-manager get pod

# add issuers
kubectl apply -f cluster-issuer-staging.yaml
kubectl apply -f cluster-issuer-production.yaml

# kubectl get ClusterIssuer -A
```