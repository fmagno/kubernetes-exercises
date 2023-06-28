include ../../config.mk

#--- SETUP --------------------------------#

SHELL := /bin/bash

.PHONY: run
run:
	echo "Running $(EX_ID)..."
	minikube start --vm-driver=docker --nodes $(NODES) -p $(EX_ID)
	minikube profile $(EX_ID)
	minikube addons enable ingress &
	helm install apps ./ex_chart \
		--values=myvalues.yaml \
		--set secrets.mongoRootUsername=$(MONGODB_USERNAME) \
		--set secrets.mongoRootPassword=$(MONGODB_PASSWORD)


.PHONY: stop
stop:
	echo 'Stopping $(EX_ID)...'
	helm uninstall apps || true
	minikube profile $(EX_ID) || true
	minikube stop -p $(EX_ID) || true


.PHONY: clean
clean: stop
	echo 'Cleaning $(EX_ID)...'
	minikube delete --profile $(EX_ID) || true
	docker network rm $(EX_ID) || true
	docker volume rm docker_mongodb_data || true
