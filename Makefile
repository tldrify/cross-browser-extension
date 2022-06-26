SHELL := /bin/bash

VERSION = $$(jq -r .version manifest.json)

.ONESHELL: 
build:
	rm -rf build
	mkdir build
	cd build
	cp -r ../*.js ../*.json ../icons .
	../bookmarklet.js.sh > bookmarklet.js
	zip -r tldrify-$(VERSION).zip *.js *.json icons
	cp tldrify-$(VERSION).zip ../
	cd ..
	rm -rf build
