#--- SETUP --------------------------------#
include config.mk

SHELL := /bin/bash

# e.g `make run ex3 ip=192.168.1.100`
.PHONY: run
run:
	cd exercises/$(EX_ID)* && \
		$(MAKE) run $(MAKEFLAGS)

.PHONY: stop
stop:
	cd exercises/$(EX_ID)* && \
		$(MAKE) stop $(MAKEFLAGS)


.PHONY: clean
clean: stop
	cd exercises/$(EX_ID)* && \
		$(MAKE) clean $(MAKEFLAGS)






