#!/usr/bin/env bash
namespace="helloworld"
cat << EOF > namespace.yaml
kind: Namespace
apiVersion: v1
metadata:
  name: $namespace
  labels:
    name: $namespace
EOF
kubectl apply -f namespace.yaml

cat << EOF > index.html
<html>
    <head>
        <title>Hello World!</title>
    </head>
    <body>
        <p>Hello World!</p>
    </body>
</html>
EOF

kubectl delete configmap hello-world --namespace $namespace
kubectl create configmap hello-world --from-file index.html --namespace $namespace


kubectl apply -f deployment.yaml --namespace $namespace
kubectl apply -f service.yaml --namespace $namespace

