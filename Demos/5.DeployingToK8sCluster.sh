
# https://dbafromthecold.com/2017/11/15/running-sql-server-in-kubernetes-on-azure-container-services-aks-ii/



# list contexts
kubectl config get-contexts



# get current context
kubectl config current-context



# switch context to remote cluster
kubectl config use-context SQLK8sCluster1



# confirm current context
kubectl config current-context



# confirm connection to cluster by viewing nodes
kubectl get nodes



# navigate to yaml file
cd ~/git/SqlServerAndContainersExtended/Demos/



# view sql yaml file
cat sqlserver.yaml



# deploy to cluster
kubectl apply -f sqlserver.yaml



# view deployment
kubectl get deployments



# view pods
kubectl get pods



# get more info on pods
kubectl get pods -o wide



# describe pods
kubectl describe pods



# view service
kubectl get service



# describe service
kubectl describe service



# view service
kubectl get service



# get pods
kubectl get pods -o wide



# delete pod
kubectl delete pod PODNAME



# view pods
kubectl get pods -o wide



# get service
kubectl get service
