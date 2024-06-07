import { DATA_FOLDER_PATH } from '../../config/pathConst';
import fs from 'fs'
import path from 'path'

import type { Selector } from 'webdriverio';

import checkIfElementExists from '../lib/checkIfElementExists';

/**
 * Set the value of the given input field to a new value or add a value to the
 * current selector value
 * @param  {String}   method   The method to use (add or set)
 * @param  {String}   label    Label of the value to be added or set in the JSON file
 * @param  {String}   filename JSON filename
 * @param  {String}   selector Element selector
 * 
 */
export default async (method: string, label: string, filename: string, selector: Selector) => {
    /**
     * The command to perform on the browser object (addValue or setValue)
     * @type {String}
     */
    const command = (method === 'add') ? 'addValue' : 'setValue';

    let fullpathFile;
    fullpathFile = path.join(DATA_FOLDER_PATH, filename);
    const data = JSON.parse(fs.readFileSync(fullpathFile, 'utf8'));
    

    // JSONから取得したラベル
    let checkValue = data[label];
    await checkIfElementExists(selector, false, 1);

    if (!label) {
        checkValue = '';
    }

    await $(selector)[command](checkValue);
};
