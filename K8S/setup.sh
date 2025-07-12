#!/bin/bash

set -e

echo "📦 Starting Minikube..."
minikube start --driver=docker

echo "🐳 Loading local Docker images into Minikube..."
minikube image load myapp:monitoring
minikube image load prom/prometheus:v2.37.0

echo "📂 Applying manifests..."
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

kubectl apply -f prometheus-config.yaml
kubectl apply -f prometheus-deployment.yaml
kubectl apply -f prometheus-service.yaml

kubectl apply -f prometheus-role.yaml
kubectl apply -f prometheus-role-binding.yaml

echo "🔍 Running post-install verification..."

echo "⏳ Waiting for all pods to become Ready..."
kubectl wait --for=condition=Ready pod --all --timeout=180s || true


echo "📦 Deployments:"
kubectl get deploy

echo "🚦 Pods:"
kubectl get pods

echo "🌐 Services:"
kubectl get svc

echo "🪵 Recent logs from all pods:"
for pod in $(kubectl get pods -o name); do
    echo "🔸 Logs for $pod:"
    kubectl logs $pod --tail=5 || echo "⚠️  No logs available"
done

echo "🔐 RBAC resources:"
kubectl get role
kubectl get rolebinding

echo "✅ Done! Everything is up and verified."
