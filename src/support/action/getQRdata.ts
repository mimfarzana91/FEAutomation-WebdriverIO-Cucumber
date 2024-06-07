import { Selector } from 'webdriverio';

const jimp = require('jimp');
const path = require('path');
const fs = require("fs");

/**
 * Pause execution for a given number of milliseconds
 * @param  {String}   selector Element selector
 */
 export default async (selector: Selector) => {
    function decodeBase64Image(dataString) {
        var matches = dataString.match(/^data:([A-Za-z-+\/]+);base64,(.+)$/),
          response = {};
      
        if (matches.length !== 3) {
          return new Error('Invalid input string');
        }
      
        response.type = matches[1];
        response.data = new Buffer(matches[2], 'base64');
      
        return response;
    }
    const QrCode = require('qrcode-reader');
    let base64Image = await $(selector).getAttribute("src");  // Load base64 image 
    let decodedImg = decodeBase64Image(base64Image);
    let imageBuffer = new Buffer(decodedImg.data, 'base64');
    //let imageBuffer  = Buffer.from(decodedImg.data, 'base64').toString();

    let qrDirectory = browser.config.qrDir;

    fs.writeFileSync(path.join(qrDirectory, '/tmpimage.jpg'), imageBuffer, {encoding: 'base64'}, function(err){
        if(err) console.log(err);
    });

    
    let buffer = fs.readFileSync(path.join(qrDirectory, '/tmpimage.jpg'));

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
