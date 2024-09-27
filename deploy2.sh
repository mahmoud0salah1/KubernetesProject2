#!/bin/bash

# Use the existing Minikube Docker environment
echo "Using Minikube Docker environment..."
eval $(minikube -p minikube docker-env)

# Apply Kubernetes manifests
kubectl create namespace webapp || true
kubectl apply -f backend-deployment.yaml
kubectl apply -f db-data-pv.yaml
kubectl apply -f db-data-pvc.yaml
kubectl apply -f db-secret.yaml
kubectl apply -f mysql-deployment.yaml
kubectl apply -f mysql-service.yaml
kubectl apply -f nginx-config.yaml
kubectl apply -f proxy-deployment.yaml

# Check Kubernetes pods and services
echo "Checking Kubernetes pods in namespace 'webapp'..."
kubectl get pods -n webapp
kubectl get deployments.apps -n webapp
kubectl get services -n webapp

# Access the service using Minikube IP
minikube ip
curl https://192.168.49.2:31000 -k
