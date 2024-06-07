import { Selector } from 'webdriverio';
/**
// Full browser screenshot

 * Check if the given elemnet is visible inside the current viewport
 * @param  {String}  name  screenshot name
 */
 export default async (name: String) => {

    // await browser.saveScreenshot('./src/img/screenshot=.png');
    // yyyy-mm-dd
    const today = new Date();
    const getFormattedDate = (date: Date): string => date.toISOString().split('T')[0];
    let filename = getFormattedDate(today).trim() + "_" + name + '.png';
    await browser.saveScreenshot('./src/img/ ' + filename);
};

