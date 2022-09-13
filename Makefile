.PHONY: help install clean

FILE := dist/sample.txt

help:
	@cat $(firstword $(MAKEFILE_LIST))

install:

run: | dist/result.json
	cat $| | jq -R 'fromjson?' | jq -r '.|select(.pos == "NOUN" and .tag != "空白").norm' | sort | uniq -c | sort -nr

dist/result.json: $(FILE) | dist
	ginza -f json $^ > $@

dist/sample.txt: | dist
	curl https://www.ohmsha.co.jp/book/9784274227943/ | xmllint --nowarning --html --xpath '//*[@id="anchor2"]/div[2]/div[1]/text()' - > $@

dist:
	mkdir $@

clean:
	rm -rf dist
