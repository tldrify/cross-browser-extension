.PHONY: zip-build appx-prepare appx-build
SHELL := /bin/bash

VERSION = $$(jq -r .version manifest.json)
PREFIX = /tmp/tldrify-edge-build

zip-build:
	zip -r tldrify-$(VERSION).zip *.js *.json icons

appx-prepare:
	rm -rf $(PREFIX)
	manifoldjs -l debug -p edgeextension -f edgeextension -m manifest.json -d $(PREFIX)

appx-build:
	manifoldjs -l debug -p edgeextension package $(PREFIX)/TLDRify/edgeextension/manifest
