.PHONY: help install clean

FILE := sample/sample.txt

help:
	@cat $(firstword $(MAKEFILE_LIST))

install:

run: $(FILE)
	ginza -f json $(FILE)

sample/sample.txt: | sample
	curl https://www.ohmsha.co.jp/book/9784274227943/ -o $@

sample:
	mkdir $@

clean:
