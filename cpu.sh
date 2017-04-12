rm -rf shell/Log/cpu/*
adb pull /proc/cpuinfo shell/Log/cpu/
cat shell/Log/cpu/cpuinfo