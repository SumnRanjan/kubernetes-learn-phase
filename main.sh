#!/bin/bash

# =========================================================
# HELM COMMANDS
# =========================================================

# Add repo
helm repo add bitnami https://charts.bitnami.com/bitnami

# Update repo
helm repo update

# Search chart
helm search repo nginx

# Create helm chart
helm create my-chart

# Install chart
helm install my-nginx bitnami/nginx

# Install in namespace
helm install my-nginx bitnami/nginx -n nginx --create-namespace

# List releases
helm list

# List releases in namespace
helm list -n nginx

# Show release history
helm history my-nginx -n nginx

# Upgrade release
helm upgrade my-nginx bitnami/nginx -n nginx

# Rollback release
helm rollback my-nginx 1 -n nginx

# Check status
helm status my-nginx -n nginx

# Get values
helm get values my-nginx -n nginx

# Show chart values
helm show values bitnami/nginx

# Uninstall release
helm uninstall my-nginx -n nginx

# Package helm chart
helm package my-chart

# Lint helm chart
helm lint my-chart

# Dry run
helm install my-nginx bitnami/nginx --dry-run

# Template rendering
helm template my-nginx bitnami/nginx

# =========================================================
# ISTIO COMMANDS
# =========================================================

# Install Istio
istioctl install --set profile=demo -y

# Verify installation
kubectl get pods -n istio-system

# Enable sidecar injection
kubectl label namespace default istio-injection=enabled

# Deploy sample app
kubectl apply -f samples/bookinfo/platform/kube/bookinfo.yaml

# Check services
kubectl get svc

# Check pods
kubectl get pods

# Apply gateway
kubectl apply -f samples/bookinfo/networking/bookinfo-gateway.yaml

# Check gateway
kubectl get gateway

# Open Kiali dashboard
istioctl dashboard kiali

# Open Grafana dashboard
istioctl dashboard grafana

# Open Prometheus dashboard
istioctl dashboard prometheus

# Open Jaeger dashboard
istioctl dashboard jaeger

# Check proxy status
istioctl proxy-status

# Analyze configuration
istioctl analyze

# Uninstall Istio
istioctl uninstall -y

# Delete istio namespace
kubectl delete namespace istio-system

# =========================================================
# SERVICE MESH COMMANDS / RELATED
# =========================================================

# Check namespace labels
kubectl get namespace --show-labels

# Enable mesh injection
kubectl label namespace default istio-injection=enabled

# Disable mesh injection
kubectl label namespace default istio-injection-

# View envoy sidecar containers
kubectl get pods -o jsonpath='{.items[*].spec.containers[*].name}'

# Describe pod
kubectl describe pod <pod-name>

# Check virtual services
kubectl get virtualservice

# Check destination rules
kubectl get destinationrule

# Check gateways
kubectl get gateway

# Check authorization policies
kubectl get authorizationpolicy

# Check peer authentication
kubectl get peerauthentication

# Check envoy config
istioctl proxy-config cluster <pod-name>

# Port forward service
kubectl port-forward svc/productpage 8080:9080

# Check ingress gateway
kubectl get svc istio-ingressgateway -n istio-system

# =========================================================
# KUBERNETES COMMANDS (USEFUL WITH ISTIO/HELM)
# =========================================================

# Get all resources
kubectl get all

# Get namespaces
kubectl get ns

# Create namespace
kubectl create ns nginx

# Apply yaml
kubectl apply -f deployment.yaml

# Delete yaml
kubectl delete -f deployment.yaml

# View logs
kubectl logs <pod-name>

# Exec into pod
kubectl exec -it <pod-name> -- bash

# Describe service
kubectl describe svc <service-name>

# Get deployments
kubectl get deploy

# Restart deployment
kubectl rollout restart deployment <deployment-name>

# Scale deployment
kubectl scale deployment nginx --replicas=3

# Check events
kubectl get events

# Cluster info
kubectl cluster-info

# Node info
kubectl get nodes -o wide