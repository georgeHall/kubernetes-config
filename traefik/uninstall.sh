#!/usr/bin/env bash

namespace="traefik"
helm uninstall traefik --namespace $namespace

kubectl delete --fromfile dashboard.yaml --namespace $namespace
kubectl delete namespace $namespace
