import { Selector } from 'webdriverio';

/**
 * Change elements transparent for visual regression
 * @param  {String}   xpath Element xpath
 */
export default async (xpath: String) => {
    
    //    return document.evaluate(path, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
    /*
    let command = "document.evaluate(\"" + xpath + "\", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.style.opacity = 0";
    console.log("============================================");
    console.log(command);
    console.log("============================================");
    */
    /*
    document.getElementByXPath = function(sValue) { var a = this.evaluate(sValue, this, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null); if (a.snapshotLength > 0) { return a.snapshotItem(0); } };
    document.getElementsByXPath = function(sValue){ var aResult = new Array();var a = this.evaluate(sValue, this, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);for ( var i = 0 ; i < a.snapshotLength ; i++ ){aResult.push(a.snapshotItem(i));}return aResult;};
    */

    //document.ElementsByXPath = function(sValue) { var a = this.evaluate(sValue, this, null, XPathResult.UNORDERED_NODE_SNAPSHOT_TYPE, null); for ( var i = 0 ; i < a.snapshotLength ; i++ ) { a.snapshotItem(i).style.opacity = 0; } };
    let command = "var a = document.evaluate(\"" + xpath + "\", document, null, XPathResult.UNORDERED_NODE_SNAPSHOT_TYPE, null); for ( var i = 0 ; i < a.snapshotLength ; i++ ) { a.snapshotItem(i).style.opacity = 0; };"
    //let command = "document.querySelector(\"" + selector + "\").style.opacity = 0"
    await browser.execute(command);
};
