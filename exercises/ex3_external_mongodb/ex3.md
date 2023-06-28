# Exercise 03

Build a cluster with:
- 2 nodes:
  - 1 node: exclusive for the control plane
  - 1 node: exclusive for app containers
    - 1 mongodb running outside the cluster
      - Map mongodb IP to an internal service/endpoints
    - 1 deployment with mongo-express
      - Use ingress to expose mongo-express
      - do not forget to install the ingress-controller:
        - `minikube addons enable ingress`
      - Also add to /etc/hosts a mapping between the chosen domain name and the IP of one of the nodes