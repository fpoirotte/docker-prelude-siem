COMPONENTS  = prelude-correlator prelude-lml prelude-manager prewikka prewikka-crontab
CONTAINERS  = $(addprefix fpoirotte/,$(COMPONENTS))
ENVIRONMENT = prod
VERSION     = latest

squash := $(shell (LC_ALL=C docker system info 2>/dev/null | grep -q '^Experimental: true') && printf "%s" "--squash")

.PHONY: all
all: run

.PHONY: run
run:
	TAG=$(VERSION) docker-compose -f docker-compose.yml -f "docker-compose.$(ENVIRONMENT).yml" up --abort-on-container-exit

.PHONY: refresh
refresh:
	./.refresh

.PHONY: clean
clean: clean_images

.PHONY: clean_images
clean_images: clean_containers
	docker rmi $(CONTAINERS)

.PHONY: clean_containers
clean_containers:
	docker rm -f prelude_prewikka_1 prelude_prewikka-crontab_1 prelude_lml_1 prelude_correlator_1 prelude_manager_1 prelude_db-gui_1 prelude_db-alerts_1
