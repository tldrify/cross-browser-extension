.PHONY: zip-build
SHELL := /bin/bash

VERSION = $$(jq -r .version manifest.json)

zip-build:
	zip -r tldrify-$(VERSION).zip *.js *.json icons

.ONESHELL: 
ff-build:
	rm -rf ff-build
	mkdir ff-build
	cd ff-build
	cp -r ../*.js ../*.json ../icons .
	../bookmarklet-ff.js.sh > bookmarklet.js
	zip -r tldrify-ff-$(VERSION).zip *.js *.json icons
	cp tldrify-ff-$(VERSION).zip ../
	cd ..
	rm -rf ff-build
