.PHONY: help install build bash clean

NAME := tamakiii-sandbox/hello-ginza

help:
	@cat $(firstword $(MAKEFILE_LIST))

install: \
	build

build:
	docker build -t $(NAME) .

bash:
	docker run -it --rm $(NAME) $@

clean:
	docker image rm $(NAME)
