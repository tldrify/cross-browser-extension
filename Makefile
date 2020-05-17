.PHONY: zip-build appx-prepare appx-build
SHELL := /bin/bash

VERSION = $$(jq -r .version manifest.json)

zip-build:
	zip -r tldrify-$(VERSION).zip *.js *.json icons

appx-prepare:
	manifoldjs -l debug -p edgeextension -f edgeextension -m manifest.json -d $$(pwd)
	jq 'del(.browser_action.theme_icons)' manifest.json > $(pwd)/TLDRify/edgeextension/manifest/Extension/manifest.json

appx-build:
	manifoldjs -l debug -p edgeextension package $$(pwd)/TLDRify/edgeextension/manifest

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
