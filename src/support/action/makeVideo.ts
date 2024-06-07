

/**
 * make video file from file
 * @param  {String}   file  Element selector
 */
export default async (file: string) => {
    const util = require('util');
    const childProcess = require('child_process');
    const exec = util.promisify(childProcess.exec);

    const cmdFirst = 'echo y | ffmpeg -loop 1 -i ' + file + ' -vcodec libx264 -pix_fmt yuv420p -t 3 -r 30 tmpvideo.mp4'
    const cmdSecond = 'echo y | ffmpeg -i tmpvideo.mp4 tmpvideo.y4m';

    let res = await exec(cmdFirst);
    console.log(res.stdout);
    let res2 = await exec(cmdSecond);
    console.log(res2.stdout);
    /*
    let res = await exec(cmdFirst, (err, stdout, stderr) => {
        if (err) {
        console.log(`stderr: ${stderr}`)
        return
        }
        console.log(`stdout: ${stdout}`)
    }
    )
  */  
    await browser.reloadSession();

    await new Promise(f => setTimeout(f, 5000));


/*    
    const ffmpeg = require('fluent-ffmpeg');
    const convertFirst = await ffmpeg(file)
        .videoCodec('libx264')
        .inputOptions('-loop 1')
        .inputOptions('-pix_fmt yuv420p')
        .inputOptions('-t 3')
        .inputOptions('-r 30')
        .on('end', () => {
            console.log(`変換完了`);
        }).save('./src/qr/tmpvideo.avi');

    const convertSecond = await ffmpeg('./src/qr/tmpimage.jpg')
        .on('end', () => {
            console.log(`変換完了`);
        }).save('./src/qr/tmpvideo.y4m');
    };
*/
}
//-loop 1 -i test.jpg -vcodec libx264 -pix_fmt yuv420p -t 3 -r 30 output.mp4