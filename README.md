cross-browser-extension
========================

Web browser TLDRify extension implemented using WebExtensions API.

## Building

### Chrome and Firefox

To build Zip file containing the extension artifact run:

    make zip-build
    
### Microsoft Edge

First, run this command to generate extension folder layout:

    make appx-prepare
    
After editing generated `/tmp/tldrify-edge-build/TLDRify/edgeextension/manifest/appxmanifest.xml` file, run:

    make appx-build
    
This will generate `.appx` file.
    
