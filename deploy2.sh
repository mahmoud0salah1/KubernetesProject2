#!/bin/bash

# Start Minikube
echo "Starting Minikube..."
minikube stop
minikube delete
minikube start

# Check Kubernetes pods in the 'webapp' namespace 
kubectl create namespace webapp
kubectl create namespace cicd
kubectl apply -f backend-deployment.yaml
kubectl apply -f db-data-pv.yaml
kubectl apply -f db-data-pvc.yaml
kubectl apply -f db-secret.yaml
kubectl apply -f jenkins-deployment.yaml
kubectl apply -f mysql-deployment.yaml
kubectl apply -f mysql-service.yaml
kubectl apply -f nginx-config.yaml
kubectl apply -f proxy-deployment.yaml




echo "Checking Kubernetes pods in namespace 'webapp'..."
kubectl get pods -n webapp
kubectl get pods -n webapp
kubectl get pods -n webapp
kubectl get pods -n webapp

# Check Kubernetes services in the 'webapp' namespace
echo "Checking Kubernetes services in namespace 'webapp'..."
kubectl get services -n webapp
curl https://192.168.49.2:31000 -k
# End of script
echo "Deployment steps completed."
