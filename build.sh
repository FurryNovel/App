rm ./www -rf
cd src || exit
pnpm install
pnpm build:client
mv ./dist/client ./../www
cd ./../www || exit
sed -i 's/="\//="\.\//g' index.html
cd ./..
npx cordova platform add android
npx cordova run android
npx cordova-hcp build