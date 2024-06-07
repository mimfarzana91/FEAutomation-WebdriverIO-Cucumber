const fs = require('fs')
const { promisify } = require('util')
const { google } = require('googleapis')
const { OAuth2Client } = require('google-auth-library')
const gmail = google.gmail('v1')
const TOKEN_PATH = __dirname + '/gmail_token.json'
const SECRET_PATH = __dirname + '/credentials.json'

//Promise
const readFileAsync = promisify(fs.readFile)

const getMessageList = params => {
  return new Promise((resolve, reject) => {
    gmail.users.messages.list(params, (error, response) => {
      if (error) {
        reject(error)
        return
      }
      resolve(response.data)
    })
  })
}

const getMessage = params => {
  return new Promise((resolve, reject) => {
    gmail.users.messages.get(params, (error, response) => {
      if (error) {
        reject(error)
        return
      }
      resolve(response.data)
    })
  })
}

const getEmail = async (email) => {
  
  // Get Credential Information
  const content = await readFileAsync(SECRET_PATH)
  const credentials = JSON.parse(content)

  //認証 Authentication
  const clientSecret = credentials.installed.client_secret
  const clientId = credentials.installed.client_id
  const redirectUrl = credentials.installed.redirect_uris[0]
  const oauth2Client = new OAuth2Client(clientId, clientSecret, redirectUrl)
  const token = await readFileAsync(TOKEN_PATH)
  oauth2Client.credentials = JSON.parse(token)

 
  // Determine the label from the email address (mailing list) string.
  let label = "";
  if (email.includes("qa_admin")) {
    label = "Label_7095983897544739811";
  } else if (email.includes("qa_sales")) {
    label = "Label_1820057164032820391";
  } else if (email.includes("qa_distributor+d")) {
    label = "Label_579848815583310353";
  } else {
    label = "Label_8637205754535553479";
  }

  try {
    const getToken = async () => {
      // Get message List
      const data = await getMessageList({auth: oauth2Client, userId: 'me', labelIds: [label]})
      //  Get the latest emails for the label
      const message = await getMessage({auth: oauth2Client, userId: 'me', id: data.messages[0].id})
      const html = Buffer.from(message.payload.parts[1].body.data,'base64').toString('utf8')
      const body = html.replace(/<br>/g, '\n').replace(/<("[^"]*"|'[^']*'|[^'">])*>/g,'');
      return body
    }
    const token = await getToken()
    return token
  } catch (err) {
    return err
  }
}

module.exports = { getEmail }