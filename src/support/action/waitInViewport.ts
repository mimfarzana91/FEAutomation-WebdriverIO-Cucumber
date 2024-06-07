import type { Selector } from 'webdriverio';

/**
 * Check if the given element is visible inside the current viewport
 * @param  {String}   selector   Element selector
 * @param  {String}   falseCase Whether to check if the element is visible
 *                              within the current viewport or not
 */
export default async (selector: Selector, falseCase: boolean) => {
    /**
     * The state of visibility of the given element inside the viewport
     * @type {Boolean}
     */
    let isDisplayed = await $(selector).isDisplayedInViewport();

    if(!isDisplayed){
        for (var i = 0; i < 10; i++) {
            await delay(1000);
            isDisplayed = await $(selector).isDisplayedInViewport();
            if(isDisplayed){
                break;
            }
        }
    }

    if (falseCase) {
        expect(isDisplayed).not.toEqual(
            true,
            // @ts-expect-error
            `Expected element "${selector}" to be outside the viewport`
        );
    } else {
        expect(isDisplayed).toEqual(
            true,
            // @ts-expect-error
            `Expected element "${selector}" to be inside the viewport`
        );
    }
};

function delay(ms: number) {
    return new Promise( resolve => setTimeout(resolve, ms) );
}
