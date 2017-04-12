rm -rf /Log/anr/.*
adb pull /data/anr /Users/king/Log
open -e /Users/king/Log/anr/*.txt
adb shell rm /data/anr/*