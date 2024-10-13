# HarmonyOS development tips (written in 2023)

HarmonyOS development tips

## How to connect HarmonyOS device for debugging (wirelessly)

1. Create hotspot from PC (or from your phone and connect to the hotspot from PC)
1. Connect to hotspot from the watch
1. On the watch, go to Settings -> developer options -> Wifi debugging: you should see Ip address and port (if not, then disable and re-enable wifi debugging option)
1. On PC, run command : `hdc tconn <ip>:<port>`

## setup signing config for debugging

1. in DevEco Studio, go to Builld -> Generate Key and csr, then create a CSR file and Keystore (.p12)
1. Get device UDID: connect device then run command: `hdc shell bm get --udid`
1. Add testing device: in appgallery console, go to device list: <https://developer.huawei.com/consumer/en/service/josp/agc/index.html#/ups/9249519184596237893> click add device, fill in the UDID and other information
1. Create certificate: go to certificate management page: <https://developer.huawei.com/consumer/en/service/josp/agc/index.html#/ups/9249519184596237889> , create new debug certificate and upload the csr file created in step 1, then download the certificate into your PC
1. Create debug profile: go to your project information page in AppGallery:<https://developer.huawei.com/consumer/en/service/josp/agc/index.html#/myProject> then to HarmonyOS provisiong, create new debug
1. in DevEco, go to File > Project Structure > Project > Signing Configs > debug and link all the files you generate in above step (look at file extension if you don't know which file goes where)

## setup signing config for release

1. in DevEco Studio, go to Builld -> Generate Key and csr, then create a CSR file and Keystore (.p12) for release
1. Create certificate: go to certificate management page: <https://developer.huawei.com/consumer/en/service/josp/agc/index.html#/ups/9249519184596237889> , create new release certificate and upload the csr file created in step 1, then download the release certificate into your PC
1. Create release profile: go to your project information page in AppGallery:<https://developer.huawei.com/consumer/en/service/josp/agc/index.html#/myProject> then to HarmonyOS provisiong, create new release, select the certificate created in step 2 and fill in other information, download the profile to your PC
1. in DevEco, go to File > Project Structure > Project > Signing Configs > release, then link all the files you generate in above step (look at file extension if you don't know which file goes where)

## how to take screenshots using command line

if you wish to take screenshot from HarmonyOS devices that don't have the feature, like wearables (smart watch), then you can use HDC cli this way:

1. connect your watch and make sure its detected, use comand "hdc list targets" to verify
2. create new script file, example name: screenshot.bat
3. open the bat file using windows notepad and add following script:

```text
set timestamp=%time:~0,2%_%time:~3,2%_%time:~6,2%
set spath="/sdcard/wearable_screeshot_%timestamp%.png"
set spath=%spath: =_%
echo %spath%

hdc shell screencap -p %spath%

hdc file recv %spath%
```

4. save the file
5. run the script by double clicking the file screenshot.bat, you should now see a screenshot from your watch in the same folder as the script file.

## HDC useful commands

HDC is a command line tool that helps you control a HarmonyOS devices, similar to ADB for android, you can find HDC in your HarmonyOS sdk in the folder toolchains `sdk_folder/toolchains/` or `sdk_folder/hmscore/x.x.x/toolchains/`

1. connect with device wirelessly: `hdc tconn <ip>:<port>` , example `hdc tconn 192.168.1.221:5555`
1. list connected devices: `hdc list targets`
1. copy file from pc to device: `hdc file send <filePath on pc> <destination path>` , example `hdc file send D:/a.txt /data/`
1. copy file from device to you PC `hdc file recv <filePath on device>`, example `hdc file recv sdcard/file.txt`
1. install a package (.app/.hap/.apk): `hdc app install <path>`, example `hdc app install myApp.hap`
1. get logs for debugging: `hdc hilog`
1. take screenshot and save on device: `hdc shell screencap -p %spath%`, example `hdc shell screencap sdcard/screenshot001.png`

## Android libraries for HarmonyOS

Many popular android libraries have been imported to HarmonyOS like RxJava, retrofit, zxing.. they are in one repo: <https://gitee.com/openharmony-tpc>

## codelabs and demo projects

you can find many HarmonyOS demo project (mostly for phones) here: <https://github.com/huaweicodelabs/harmonyos-codelabs>

## other tips

1. generate jks from p12 (replace upcase words):
   `keytool -importkeystore  -srckeystore INPUT.p12 -destkeystore RESULT.jks -srcstoretype PKCS12 -deststoretype jks -srcstorepass PASSWORD -deststorepass PASSWORD -srcalias KEY0 -destalias KEY0 -srckeypass PASSWORD -destkeypass PASSWORD`

## facts

1. maximum .app package size is 2 GB
1. maximum .hap package size is 10 MB for sport watches, and 2 GB for other devices
1. package name cannot exceed 128 characters, and cannot contains these words: oh, ohos, harmony, harmonyos, openharmony, system

## good to know

1. most of the links above may lead to pages with chinese content, use Google Translate extension for chromium browsers to easily translate it to your language
1. HarmonyOS is moving from java to typscript, starting new project in java is not future proof and you may need to re-write the whole app when java is deprecated
