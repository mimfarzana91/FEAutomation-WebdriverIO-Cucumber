import { Selector } from 'webdriverio';

const jimp = require('jimp');
const path = require('path');
const fs = require("fs");

/**
 * Open the given URL
 * @param  {String}   type Type of navigation (getUrl or site)
 * @param  {String}   page The URL to navigate to
 */
 export default async (file: string) => {
    let QrCode = require('qrcode-reader');
    let qrDirectory = browser.config.qrDir;
    
    let buffer = fs.readFileSync(file);

    jimp.read(buffer, function(err, image) {
        if (err) {
            console.error(err);
            // TODO handle error
        }
        let qr = new QrCode();
        qr.callback = function(err, value) {
            if (err) {
                console.error(err);
                // TODO handle error
            }
            console.log(value.result);
            console.log(value);
            browser.config.qrData = value.result;
        };
        qr.decode(image.bitmap);
        //console.log(browser.config);
    });

};
