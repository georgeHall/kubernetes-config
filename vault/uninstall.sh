#!/usr/bin/env bash

namespace="vault"
helm uninstall vault --namespace $namespace

kubectl delete -f route.yaml

kubectl delete namespace vault
