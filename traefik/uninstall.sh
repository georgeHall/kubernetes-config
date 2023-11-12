#!/usr/bin/env bash

namespace="traefik"
helm uninstall traefik --namespace $namespace
