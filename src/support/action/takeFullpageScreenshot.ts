/**
// Full browser screenshot

 * Check if the given elemnet is visible inside the current viewport
 * @param  {String}  tagname  save tag name
 */
export default async (tagname: String) => {
  //   const { promises: fs } = require("fs");
  //   const dir = "./src/ScreenShot_img/";
  //   const files = await fs.readdir(dir);
  //   console.log(files.length);
  //   let screenshot = "screenshot" + files.length+1;

  // await browser.saveScreenshot("./src/ScreenShot_img/" + screenshot + ".png");
  await browser.saveFullPageScreen(tagname, { /* some options */ });
};