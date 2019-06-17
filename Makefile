.PHONY: zip-build appx-prepare appx-build
SHELL := /bin/bash

VERSION = $$(jq -r .version manifest.json)

zip-build:
	zip -r tldrify-$(VERSION).zip *.js *.json icons

appx-prepare:
	manifoldjs -l debug -p edgeextension -f edgeextension -m manifest.json

appx-build:
	manifoldjs -l debug -p edgeextension package TLDRify/edgeextension/manifest
