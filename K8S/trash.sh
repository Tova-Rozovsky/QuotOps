#!/bin/bash

echo "🔥 Deleting all resources..."
kubectl delete -f deployment.yaml || true
kubectl delete -f service.yaml || true
kubectl delete -f prometheus-config.yaml || true
kubectl delete -f prometheus-deployment.yaml || true
kubectl delete -f prometheus-service.yaml || true
kubectl delete -f prometheus-role.yaml || true
kubectl delete -f prometheus-role-binding.yaml || true


echo "🛑 Stopping Minikube..."
minikube stop

echo "🧹 Optionally run 'minikube delete' to fully clean up"