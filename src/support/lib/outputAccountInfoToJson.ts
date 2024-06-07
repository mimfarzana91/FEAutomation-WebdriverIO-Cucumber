import { DATA_FOLDER_PATH } from '../../config/pathConst';
import fs from 'fs'
import path from 'path'

/**
 * Output the account information listed in the spreadsheet as a JSON file.
 * Data Format: key:userID, value:password
 */

const SheetApi = require('../../apis/gmail/getValuesFromSpreadsheet');

export default async () => {
    const accountSheetId = "1lGt7pAXi_trFJoABrOjPWfxw-flvBesiyLkn3Q28XZ8";
    // Specify a wide range to account additions.
    const accountRange   = "AccountList!G3:H50";
    const jsonFilename   = "accountInfo.json";
    const values = await SheetApi.getValuesFromSpreadsheet(accountSheetId, accountRange);
    let accounts = {};

    // Check modified account information
    for (var row of values) {
      if (row[0] === "") {
        break;
      }
      let id       = row[0];
      let password = row[1];
      accounts[id] = password;
    }
    console.log(accounts);
    
    let accountInfoJson = JSON.stringify(accounts, null, 2);
    let fullpathFile;
    fullpathFile = path.join(DATA_FOLDER_PATH, jsonFilename);
    fs.writeFileSync(fullpathFile, accountInfoJson);

    
};