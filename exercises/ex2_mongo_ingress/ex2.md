# Exercise 02

Build a cluster with:
- 2 nodes:
  - 1 node: for the control plane
  - 1 node: worker node
    - 1 deployment with mongodb
      - 2 replicas
    - 1 deployment with mongo-express
      - Use ingress to expose mongo-express
      - do not forget to install the ingress-controller:
        - `minikube addons enable ingress`
      - Also add to /etc/hosts a mapping between the chosen domain name and the IP of one of the nodes
