.PHONY: help install build bash clean

NAME := tamakiii-sandbox/hello-ginza

help:
	@cat $(firstword $(MAKEFILE_LIST))

install: \
	build

build:
	docker build -t $(NAME) .

run:
	docker run -it --rm -v $(CURDIR):/work -w /work $(NAME) make run

bash: build
	docker run -it --rm -v $(CURDIR):/work -w /work $(NAME) $@

clean:
	docker image rm $(NAME)
