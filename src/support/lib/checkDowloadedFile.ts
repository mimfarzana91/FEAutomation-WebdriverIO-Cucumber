import { DOWNLOAD_FOLDER_PATH } from '../../config/pathConst';
import fs from 'fs'
import path from 'path'
/**
 * Check if the downloaded file is stored in the download directory in the browser.
 * This module checks that the name of the latest file in the download directory matches the file that was downloaded with the latest ctime.
 * This module does not check file contents
 * @param  {String}   expectedFile      
 */

export default async (
    expectedFile: string
) => {
    //const downloadDir = path.join(process.cwd(), "/.tmp/files/")
    const files = fs.readdirSync(DOWNLOAD_FOLDER_PATH)
    let fullpathFile;
    let latestCtime;
    let latestFile;
    latestCtime = new Date('2022-01-01 00:00:00');
    
    files.forEach(file => {
        fullpathFile = path.join(DOWNLOAD_FOLDER_PATH, file)
        const { ctime, mtime, atime } = fs.statSync(fullpathFile);
        if (latestCtime < ctime) {
          latestCtime = ctime;
          latestFile  = file;
        }
    })
    expect(latestFile).toEqual(
      expectedFile,
      // @ts-expect-error
      `Expected file name to be "${expectedFile}" but found "${latestFile}"`
    );
    
};