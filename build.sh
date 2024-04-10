rm ./www -rf
cd src || exit
git pull
pnpm install
pnpm build:client
mv ./dist/client ./../www
cd ./../www || exit
sed -i 's/="\//="\.\//g' index.html
cd ./..
#cordova run android
cordova-hcp build