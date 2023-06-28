# Exercise 01

Build a cluster with:
- 2 nodes:
  - 1 node: for the control plane
  - 1 node: worker node
    - 1 deployment with mongodb
      - 2 replicas
    - 1 deployment with mongo-express
      - mongo-express should be accessible from the browser (NodePort)
