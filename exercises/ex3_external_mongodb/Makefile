include ../../config.mk

#--- SETUP --------------------------------#

SHELL := /bin/bash

.PHONY: run
run:
	echo "Running $(EX_ID)..."
	cd docker && \
		echo "MONGO_INITDB_ROOT_USERNAME=$(MONGODB_USERNAME)" > .env && \
		echo "MONGO_INITDB_ROOT_PASSWORD=$(MONGODB_PASSWORD)" >> .env &&\
		docker compose -f mongodb-dockercompose.yml up -d

	minikube start --vm-driver=docker --nodes $(NODES) -p $(EX_ID)
	minikube profile $(EX_ID)
	minikube addons enable ingress &
	helm install apps ./ex_chart \
		--values=myvalues.yaml \
		--set services.mongodb.addressType=$(MONGODB_ADDRESS_TYPE) \
		--set services.mongodb.address=$(MONGODB_ADDRESS) \
		--set secrets.mongoRootUsername=$(MONGODB_USERNAME) \
		--set secrets.mongoRootPassword=$(MONGODB_PASSWORD)


.PHONY: stop
stop:
	echo 'Stopping $(EX_ID)...'
	helm uninstall apps || true
	minikube profile $(EX_ID) || true
	minikube stop -p $(EX_ID) || true
	cd docker && \
		docker compose -f mongodb-dockercompose.yml down || true


.PHONY: clean
clean: stop
	echo 'Cleaning $(EX_ID)...'
	minikube delete --profile $(EX_ID) || true
	docker volume ls -q --filter "name=$(EX_ID)*" | xargs docker volume rm || true
	docker network rm $(EX_ID) || true
	docker volume rm docker_mongodb_data || true
