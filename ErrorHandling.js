const { IncomingWebhook } = require("@slack/webhook");
// Slack URL set to 'mbdv_dwango_auto_test_uat'
const webhook = new IncomingWebhook("SLACK_URL");

//arg2 
//${GITHUB_SERVER_URL}/${GITHUB_REPOSITORY}/actions/runs/${GITHUB_RUN_ID}

let url = "";
let time = "3";

for(var i = 0;i < process.argv.length; i++){
  if(i === 2){
    url = process.argv[i]
  }
  // if(i === "3"){
  //   time = process.argv[i]
  // }
}

if (time === "3") {
  const body_text = (url !== "" ? "Oh No! We hit an Snag! \n" + url : "Oh No! We hit an Snag!");

  webhook.send({
    text: body_text,
  });
}

