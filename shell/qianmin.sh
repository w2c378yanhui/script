if [ ! -d $HOME/qianming ]
then
mkdir $HOME/qianming
fi

if [ ! -f $HOME/qianming/*.keystore ]
then
echo copy your maxrap.jks url here:
read maxrapurl

while [[ $maxrapurl != *.jks ]]
do
echo error url is wrong should end with .jks, please input:
read maxrapurl
done

cp $maxrapurl $HOME/qianming/maxrap.keystore
fi

rm -rf $HOME/qianming/app*
echo please copy your apkfile here:
read url
cp $url $HOME/qianming/app_unsigned.apk
zip -d $HOME/qianming/app_unsigned.apk META-INF/*
jarsigner -digestalg SHA1 -sigalg MD5withRSA -verbose -keystore $HOME/qianming/maxrap.keystore -storepass migu@xinjiang -signedjar $HOME/qianming/app_signed.apk $HOME/qianming/app_unsigned.apk maxrap
echo "doinstall?(y/n)"
read doinstall
if [ $doinstall == "y" ]
then
adb install -r $HOME/qianming/app_signed.apk
adb shell am start -n "com.migu.maxrap/com.migu.maxrap.activity.SplashActivity"
else
open qianming/
fi
