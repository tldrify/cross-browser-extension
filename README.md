cross-browser-extension
========================

Web browser TLDRify extension implemented using WebExtensions API.

## Building

### Firefox

To build Zip file containing the extension artifact run:

    make ff-build

### Chrome

To build Zip file containing the extension artifact run:

    make zip-build
    
### Microsoft Edge

First, run this command to generate extension folder layout:

    make appx-prepare
    
After editing generated `TLDRify/edgeextension/manifest/appxmanifest.xml` file, run:

    make appx-build
    
This will generate `.appx` file.
 
