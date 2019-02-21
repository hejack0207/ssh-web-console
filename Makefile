SHELL:=/usr/bin/zsh

all: build

/tmp/web-console/dist:
	cd /tmp;\
	git clone https://github.com/genshen/webConsole web-console;\
	cd web-console;\
	yarn install;\
	yarn build

build: /tmp/web-console/dist
	go get github.com/rakyll/statik
	cp -r /tmp/web-console/dist ./dist
	statik dist  # use statik tool to convert files in 'dist' dir to go code, and compile into binary.
	export GO111MODULE=on && go build

.PHONY: all
