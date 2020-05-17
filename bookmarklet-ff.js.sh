#!/bin/bash

for url in https://tldrify.com/static/js/ajax-spin.js \
  https://tldrify.com/static/js/ajaxslt.js \
  https://tldrify.com/static/js/rangy-core.js \
  https://tldrify.com/static/js/jquery.js \
  https://tldrify.com/static/js/tldr.js
do
  curl -sSf $url
  echo
done

cat<<EOF
console.log('OK');

window.wrappedJSObject.TLDR = cloneInto(
  TLDR, window, {cloneFunctions: true});

TLDR.save();
EOF
