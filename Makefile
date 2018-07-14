COMPONENTS = prelude-correlator prelude-lml prelude-manager prewikka
CONTAINERS = $(addprefix fpoirotte/,$(COMPONENTS))

all: run

run:
	docker-compose up --abort-on-container-exit

build: $(addprefix build-,$(CONTAINERS))

push: $(addprefix push-,$(CONTAINERS))

build-fpoirotte/%:
	docker build -f "Dockerfile.$(subst prelude-,,$*)" --pull=true -t "fpoirotte/$*:latest" .

push-fpoirotte/%:
	docker push "fpoirotte/$*"

clean: clean_images

clean_images: clean_containers
	docker rmi $(CONTAINERS)

clean_containers:
	docker rm -f prelude_prewikka_1 prelude_lml_1 prelude_correlator_1 prelude_manager_1 prelude_db-gui_1 prelude_db-alerts_1

.PHONY: all run build build-fpoirotte/% push push-fpoirotte/% \
		clean clean_images clean_containers
