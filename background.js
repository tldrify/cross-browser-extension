window.browser = (function () {
  return window.msBrowser ||
    window.browser ||
    window.chrome;
})();

function tldrify(tab) {
	browser.tabs.executeScript(tab.id, {file: "bookmarklet.js"})
}

browser.browserAction.onClicked.addListener(tldrify);

browser.contextMenus.create({
	"title": "TLDRify",
	"contexts": ["selection"],
	"onclick": function(info, tab) {
		tldrify(tab);
	}
});
