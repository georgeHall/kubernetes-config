#!/usr/bin/env bash

namespace="homeassistant"

kubectl delete -f deployment.yaml --namespace $namespace
kubectl delete -f ingress.yaml --namespace $namespace
kubectl delete -f pv.yaml --namespace $namespace
kubectl delete -f service.yaml --namespace $namespace
kubectl delete -f namespace.yaml --namespace $namespace
