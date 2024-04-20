rm ./www -rf
git submodule update --init --recursive
git submodule update --recursive --remote
cd src || exit
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
