@echo off
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "timestamp=%HH%-%Min%-%Sec%"

@REM  update the name
set name=MYAPP-%timestamp%

@REM todo: update the following paths
set node="C:\Program Files\Huawei\DevEco Studio5.3\tools\node\node.exe"
set hvigor= "C:\Program Files\Huawei\DevEco Studio5.3\tools\hvigor\bin\hvigorw.js"

set buildFolderRoot=entry\build\default
set buildFolder=%buildFolderRoot%\outputs\default

@REM echo cleaning build folder
@REM @RD /S /Q %buildFolderRoot%

echo building new .hap package

@REM %node% %hvigor% --mode module -p product=default assembleHap --analyze=normal --parallel --incremental --daemon

%node% %hvigor% --mode module -p product=default assembleHap --analyze=normal --parallel --incremental --daemon

cd %buildFolder%

set hapPath=/sdcard/haps/%name%.hap

echo cleaning .hap folder on phone
adb shell rm -Rf /sdcard/haps/

echo sending .hap to device
adb push entry-default-signed.hap %hapPath%

echo opening DevEco studio
adb shell am start -n com.huawei.deveco.assistant/.activity.StartUpActivity

timeout /t 4

echo navigating to apps list
adb shell input tap 600 1500

timeout /t 1

echo refreshing DEA .hap list
adb shell input swipe 300 500 300 1200 100

echo waiting 2 seconds to refresh the list
timeout /t 2

echo installing
adb shell input tap 940 550

echo FINISHED