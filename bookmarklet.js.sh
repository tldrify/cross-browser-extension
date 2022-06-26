#!/bin/bash

for url in https://tldrify.com/static/js/ajax-spin.js \
  https://tldrify.com/static/js/ajaxslt.js \
  https://tldrify.com/static/js/rangy-core.js \
  https://tldrify.com/static/js/jquery.js \
  https://tldrify.com/static/js/tldr.js
do
  curl -sSf "${url}?$(date +"%s")"
  echo
done

cat<<EOF
/*
window.wrappedJSObject.TLDR = cloneInto(
  TLDR, window, {cloneFunctions: true});
*/

TLDR.save(true);
EOF
