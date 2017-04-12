rm -rf $HOME/Downloads/yanhui*.png
Time=$(date +%y-%m-%d:%H:%M:%S)
adb shell /system/bin/screencap -p /sdcard/yanhui$Time.png
adb pull /sdcard/yanhui$Time.png $HOME/Downloads
open $HOME/Downloads/yanhui$Time.png
