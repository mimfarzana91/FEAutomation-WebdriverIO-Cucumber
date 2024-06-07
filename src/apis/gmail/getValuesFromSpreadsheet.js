const fs = require('fs')
const { promisify } = require('util')
const { google } = require('googleapis')
const { OAuth2Client } = require('google-auth-library')
const spreadsheet = google.sheets('v4')
const TOKEN_PATH = __dirname + '/sheet_token.json'
const SECRET_PATH = __dirname + '/credentials.json'

//Promise 化
const readFileAsync = promisify(fs.readFile)

const getValues = params => {
  return new Promise((resolve, reject) => {
    spreadsheet.spreadsheets.values.get(params, (error, response) => {
      if (error) {
        reject(error);
        return;
      } else {
        resolve(response);
      }
    })
  })
}

//const getValuesFromSpreadsheet = async (spreadsheetId, range) => {
  // 後で削除
  async function getValuesFromSpreadsheet(id, sheetRange) {
  //クレデンシャル情報の取得
  const content = await readFileAsync(SECRET_PATH) //クライアントシークレットのファイルを指定
  const credentials = JSON.parse(content) //クレデンシャル

  //認証
  const clientSecret = credentials.installed.client_secret
  const clientId = credentials.installed.client_id
  const redirectUrl = credentials.installed.redirect_uris[0]
  const oauth2Client = new OAuth2Client(clientId, clientSecret, redirectUrl)
  const token = await readFileAsync(TOKEN_PATH)
  oauth2Client.credentials = JSON.parse(token)
  try {
    const getToken = async () => {
      try {
        const result = await getValues({auth: oauth2Client, spreadsheetId: id, range: sheetRange});
        const rows = result.data.values;
        return rows;
      } catch (err) {
        console.log(err);
        throw err;
      }
    }
    const token = await getToken()
    return token
  } catch (err) {
    return err
  }
}

// 後で削除 
/*
let testId = "1lGt7pAXi_trFJoABrOjPWfxw-flvBesiyLkn3Q28XZ8";
let testRange = "AccountList!F3:G10";
let test; 
test = getValuesFromSpreadsheet(testId, testRange).catch(console.error);
*/
module.exports = { getValuesFromSpreadsheet }