#!/usr/bin/env bash

helm repo add metallb https://metallb.github.io/metallb
helm repo add traefik https://traefik.github.io/charts
helm repo add hashicorp https://helm.releases.hashicorp.com
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/

helm repo update

echo "Installing NFS Subdir external provisioner"
helm upgrade --install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner -f ./nfs/values.yaml
echo "Installed NFS Subdir external provisioner"

namespace="traefik"
kubectl apply --filename ./traefik/namespace.yaml
helm upgrade --install traefik traefik/traefik -f ./traefik/values.yaml --namespace $namespace
kubectl apply --filename ./traefik/dashboard.yaml --namespace $namespace
