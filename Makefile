.PHONY: help install clean

FILE := sample/sample.txt

help:
	@cat $(firstword $(MAKEFILE_LIST))

install:

run: $(FILE)
	ginza -f json $(FILE)

sample/sample.txt: | sample
	curl https://www.ohmsha.co.jp/book/9784274227943/ | xmllint --nowarning --html --xpath '//*[@id="anchor2"]/div[2]/div[1]/text()' - > $@

sample:
	mkdir $@

clean:
	rm -rf sample
