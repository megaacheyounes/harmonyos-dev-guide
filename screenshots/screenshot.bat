set timestamp=%time:~0,2%_%time:~3,2%_%time:~6,2%
set spath="/sdcard/wearable_screeshot_%timestamp%.png"
set spath=%spath: =_%
echo %spath%

hdc shell screencap -p %spath%

hdc file recv %spath%
cd ..