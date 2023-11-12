#!/usr/bin/env bash

namespace="traefik"
cat << EOF > namespace.yaml
kind: Namespace
apiVersion: v1
metadata:
  name: $namespace
  labels:
    name: $namespace
EOF
kubectl apply --filename namespace.yaml

helm upgrade --install traefik traefik/traefik -f values.yaml --namespace $namespace

kubectl apply --filename dashboard.yaml --namespace $namespace
