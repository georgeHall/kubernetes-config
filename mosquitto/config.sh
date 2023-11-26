#!/usr/bin/env bash

namespace="mqtt"
cat << EOF > namespace.yaml
kind: Namespace
apiVersion: v1
metadata:
  name: $namespace
  labels:
    name: $namespace
EOF
kubectl apply --filename namespace.yaml

kubectl apply --filename pv.yaml --namespace $namespace
kubectl apply --filename deployment.yaml --namespace $namespace
kubectl apply --filename service.yaml --namespace $namespace
kubectl apply --filename ingress.yaml --namespace $namespace
