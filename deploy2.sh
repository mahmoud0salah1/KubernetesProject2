#!/bin/bash

# Set PATH to include the directory where Minikube and Kubectl are installed
export PATH=$PATH:$HOME/bin

# Start Minikube
echo "Starting Minikube..."
minikube start --driver=docker

# Check Kubernetes pods in the 'webapp' namespace 
kubectl create namespace webapp
kubectl apply -f backend-deployment.yaml
kubectl apply -f db-data-pv.yaml
kubectl apply -f db-data-pvc.yaml
kubectl apply -f db-secret.yaml
kubectl apply -f mysql-deployment.yaml
kubectl apply -f mysql-service.yaml
kubectl apply -f nginx-config.yaml
kubectl apply -f proxy-deployment.yaml

echo "Checking Kubernetes pods in namespace 'webapp'..."
kubectl get pods -n webapp
kubectl get deployments.apps -n webapp
minikube ip

# Check Kubernetes services in the 'webapp' namespace
echo "Checking Kubernetes services in namespace 'webapp'..."
kubectl get services -n webapp
kubectl get services -n webapp


# End of script
