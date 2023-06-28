# Commands cheat sheet

## minikube


- `minikube profile`: show the selected profile name
- `minikube profile [profile name]`: set profile
- `minikube profile list`: list all profiles
- `minikube profile set [profile name]`
- `minikube start --vm-driver=docker`: create and start cluster
- `minikube start -p [profile name]`
- `minikube start --nodes [number of nodes]`
- `minikube status`: status information about:
  - host
  - kubelet
  - apiserver
  - kubeconfig


## kubectl

- `kubectl create namespace [new namespace]`: create a namespace
- `kubectl config set-context --current --namespace [new namespace]`: select a namespace

- `kubectl config get-contexts`: lists all contexts/clusters
- `kubectl config current-context`: get the context - username, cluster, namespace
- `kubectl config delete-context [context name]`

- `kubectl get [component]`:
  - `nodes`
  - `deployments`
  - `pods`
  - `services`
  - `ingress`
  - `replicasets`
  - `jobs`
  - `cronjobs`

- `kubectl apply -f nginx-depl.yaml`
- `kubectl describe [deployment, pod, service] [component name]`
- `kubectl logs [pod name]`
- `kubectl exec -it [pod name] -- bin/bash`

- `kubectl create deployment nginx-depl --image=nginx`: usually not used. Instead use `apply`
- `kubectl top node`: show CPU and MEMORY usage
- `kubectl rollout [operation] [object type] [object name]`:
  - `operations`:
    - history
    - pause
    - restart
    - resume
    - status
    - undo

- `kubectl create serviceaccount [service account name]`
- `kubectl get serviceaccount`: list service accounts
- `kubectl describe serviceaccount [service account name]`: e.g view the secret that stores the tokens.


- `minikube start --nodes 2 -p multinode-demo`: start a cluster with 2 nodes with profile name 'multinode-demo'

- `minikube service [service name]`: returns an url for the the service specified

## kubens

- `kubens`: view/change namespace in use

## Helm

- `helm repo add [repo name] [repo url]`:
  - e.g `helm repo add bitnami https://charts.bitnami.com/bitnami`
- `helm repo update`: update all repos
- `helm install [release name] [repo name/package]`:
  - e.g `helm install mysql bitnami/mysql`
  - `[release name]`: name representing the installed chart and the it is also the prefix to all resources instantiated by this chart.
- `helm pull [custom repo name]/[chart name] --untar=true`: pulls the chart to a local directory
- `helm list`: list all the charts installed in the cluster
- `helm uninstall [release name]`
- `helm create [chart name]`
- `helm template [chart folder] --values=[myvalues yaml] > [whole yaml file]`: generate a full yaml with values overriden by [myvalues yaml] and writes its contents to [thole yaml file]
- `helm install [release name] [chart name as a local chart folder] --values=[myvalues yaml]`: install a chart from a folder and override values