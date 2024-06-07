import setInputField from '../action/setInputField';
import openWebsite from '../action/openWebsite';

// ## When using MailSlurp ##
// const MailSlurp = require("mailslurp-client").default;
// const apiKey = "";
// const mailslurp = new MailSlurp({apiKey});
// let mailId: string

const GmailApi = require('../../apis/gmail/gmailApi');
let randomEmail: string

class EmailAuthentication {

    async typeRandomEmail() {
        randomEmail = "auto.test.dw" + "+" + Math.random().toString(32).substring(2) + "@gmail.com" // Need Update gmail address
        // ## When using MailSlurp ##
        // let inbox = await mailslurp.createInbox();
        // await setInputField("set", inbox.emailAddress, "//*[@id='mailAddress']")
        // console.log(inbox.emailAddress);
        // mailId = inbox.id

        await setInputField("set", randomEmail , "//*[@id='mailAddress']")
    }

    async handleConfirmOnEmail() {
        const email = await GmailApi.getRegisterToken(randomEmail)
        let link
        let mailArray = email.split(/\n/);
        console.log(mailArray);
        for (var row of mailArray) {
            if(row.match(/http/)){
                link = row.replace(/^<.*">/g, '').replace("</a>", '').replace("<br>", "").replace("\r", "").replace("amp;", "").replace("&amp;", "&")
            }
        }
        if (link != null && link.length > 0) {
            await openWebsite("url", link)
        }
        // ## When using MailSlurp ##
        // let email = await mailslurp.waitForLatestEmail(mailId);
        // let link;
        // let mailArray = email.body.split(/\n/);
        // console.log(mailArray);
        // for (var row of mailArray) {
        //     if(row.match(/http/)){
        //         link = row.replace(/^<.*">/g, '').replace("</a>", '').replace("<br>", "").replace("\r", "").replace("amp;", "")
        //     }
        // }
        // if (link != null && link.length > 0) {
        //     await openWebsite("url", link)
        // }
    }
}

export default new EmailAuthentication();
