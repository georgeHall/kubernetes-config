#!/usr/bin/env bash

namespace="vault"
cat << EOF > namespace.yaml
kind: Namespace
apiVersion: v1
metadata:
  name: $namespace
  labels:
    name: $namespace
EOF
kubectl apply -f namespace.yaml

helm upgrade --install vault hashicorp/vault --namespace $namespace -f values.yaml

kubectl apply -f route.yaml --namespace $namespace

kubectl exec vault-0 --namespace $namespace -- vault operator init \
  -key-shares=1 \
  -key-threshold=1 \
  -format=json > cluster-keys.json

VAULT_UNSEAL_KEY=$(jq -r ".unseal_keys_b64[]" cluster-keys.json)

kubectl exec vault-0 --namespace $namespace -- vault operator unseal $VAULT_UNSEAL_KEY

echo "token = \"$(jq -r ".root_token" cluster-keys.json)\"" > ./terraform/vars.auto.tfvars
echo "addr = http://vault.gerh.co.uk" >> ./terraform/vars.auto.tfvars
