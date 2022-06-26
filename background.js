function injectScripts(tab) {
  chrome.scripting.executeScript({
    target: {
      tabId: tab.id
    },
    files: ["bookmarklet.js"]
  })
}

chrome.action.onClicked.addListener(injectScripts);

chrome.runtime.onInstalled.addListener(() => {
  chrome.contextMenus.create({
    id: "tldrify-context-menu",
    title: "TLDRify",
    contexts: ["selection"]
  });
});

chrome.contextMenus.onClicked.addListener((info, tab) => injectScripts(tab));

chrome.runtime.onMessage.addListener((request, sender, sendResponse) => {
  if (request.query == "createCitation") {
    fetch("https://tldrify.com/api/create", {
        "method": "POST",
        "body": JSON.stringify({
          url: request.url,
          data: request.data
        }),
        "headers": {
          "Content-Type": "application/json"
        }
      })
      .then(res => res.json())
      .then(json => sendResponse(json));
  }
  return true;
});
