/**
 * Open the given URL
 * @param  {String}   type Type of navigation (getUrl or site)
 * @param  {String}   page The URL to navigate to
 */
export default async (type: 'url' | 'site', page: string) => {
    /**
     * The URL to navigate to
     * @type {String}
     */
    const url = (type === 'url') ? page : browser.options.baseUrl + page;
    //browser.startTracing()
    await browser.enablePerformanceAudits()
    await browser.url(url);
    console.log( await browser.getMetrics())
    //browser.endTracing()
    await browser.disablePerformanceAudits()
};
