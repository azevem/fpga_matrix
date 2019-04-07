
pwd:=$(shell pwd)

dev_code=0403:6010

device:="/dev/bus/usb/$(shell lsusb -d $(dev_code) | cut -d: -f1 | cut -d\  -f2,4 | tr ' ' '/')"

docker_img=icetools
docker_base=sudo \
			docker run \
			-it \
			--rm \
			-v $(pwd):/app/ \
			-w="/app" \
			--device $(device)

docker_cmd=$(docker_base) $(docker_img)

xdg_auth="$(shell echo $(XDG_RUNTIME_DIR))"
docker_gui=$(docker_base) \
			-e DISPLAY \
			-e XDG_RUNTIME_DIR \
			-v $(xdg_auth):$(xdg_auth) \
			-v /tmp/.X11-unix:/tmp/.X11-unix \
			-e XAUTHORITY \
			$(docker_img)

debug:
	@echo $(docker_gui)

.PHONY: prepare
prepare: migen
	@cd icetools && sudo make install_docker
	@cd icetools && sudo make build_image

migen:
	@git clone https://github.com/m-labs/migen "migen_git"
	#@PYTHONPATH="$(pwd)/migen"
	@ln -s migen_git/migen migen

.PHONY: shell
shell:
	@$(docker_gui) /bin/bash

.PHONY: build
build:
	@$(docker_cmd) make build

program:
	@$(docker_cmd) make program





