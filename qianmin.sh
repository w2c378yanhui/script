rm -rf $HOME/qianming/app*
echo please copy your apkfile here:
read url
cp $url $HOME/qianming/app_unsigned.apk
zip -d $HOME/qianming/app_unsigned.apk META-INF/*
jarsigner -digestalg SHA1 -sigalg MD5withRSA -verbose -keystore $HOME/qianming/maxrap.keystore -storepass migu@xinjiang -signedjar $HOME/qianming/app_signed.apk $HOME/qianming/app_unsigned.apk maxrap
echo "doinstall?(y/n)"
read doinstall
if [ $doinstall-eq"y" ]
then
adb install -r $HOME/qianming/app_signed.apk
adb shell am start -n "com.migu.maxrap/com.migu.maxrap.activity.SplashActivity"
fi
