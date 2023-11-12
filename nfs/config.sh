#!/usr/bin/env bash

helm upgrade -install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner -f ./values.yaml
