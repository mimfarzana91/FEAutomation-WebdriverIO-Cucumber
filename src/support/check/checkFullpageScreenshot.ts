/**
 * Check the title of the current browser window
 * @param  {string}     tagname tagname of screen shot
 */
export default async (tagname: string) => {

    // Check a full page screenshot
    expect(
        await browser.checkFullPageScreen(tagname, { /* some options */ })
        ).toEqual(0);
};
