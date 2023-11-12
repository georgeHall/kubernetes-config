#!/usr/bin/env bash
namespace="metallb"

cat << EOF > namespace.yaml
kind: Namespace
apiVersion: v1
metadata:
  name: $namespace
  labels:
    name: $namespace
EOF

kubectl apply -f namespace.yaml

helm upgrade --install metallb metallb/metallb --namespace $namespace

delay 60

kubectl apply --filename ./$namespace/IPAddressPool.yaml --namespace $namespace
kubectl apply --filename ./$namespace/L2Advertisement.yaml --namespace $namespace
