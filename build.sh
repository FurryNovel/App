rm ./www -rf
cd src || exit
git pull
pnpm install
pnpm build:client
mv ./dist/client ./../www
cd ./../www || exit
#sed -i 's/="\//="\.\//g' index.html
cd ./..
echo "{}" > ./platforms/android/android.json
npx cordova platform add android
npx cordova run android
npx cordova-hcp build