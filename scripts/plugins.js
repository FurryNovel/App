const fs = require('fs');
const path = require('path');


const platformRoot = path.join('./', 'platforms/android');


let config = fs.readFileSync(path.join(platformRoot, 'app/src/main/res/xml/config.xml'), { encoding: 'utf8' });

if (config.indexOf('cordova-hot-code-push-plugin-renew') !== -1) {
    return;
}
config = config.replace(
    '</widget>',
    `   <feature name="cordova-hot-code-push-plugin-renew">
            <param name="package" value="com.nordnetab.chcp.main.HotCodePushPlugin" />
            <param name="onload" value="true" />
        </feature>
    </widget>`
);

fs.writeFileSync(path.join(platformRoot, 'app/src/main/res/xml/config.xml'), config, { encoding: 'utf8' });