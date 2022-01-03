#!/bin/bash
set -e

if [ -z "$MUTATA_ROOT_PATH" ]
then
      echo -e "Please provide MUTATA_ROOT_PATH\nExample:\nexport MUTATA_ROOT_PATH=$PWD"
			exit -1
fi
source $MUTATA_ROOT_PATH/SetupEnv.sh

license_path=$MUTATA_ROOT_PATH/license.json

if [ ! -f $license_path ]; then
    echo "license.json does not exist at $license_path"
    exit -1
fi

license=$(cat $license_path | sed 's/.*"license":"\{0,1\}\([^,"]*\)"\{0,1\}.*/\1/')

expires=$(cat $license_path | sed 's/.*"expires":"\{0,1\}\([^,"]*\)"\{0,1\}.*/\1/')


swift_android_dir=$MUTATA_BUILD_PATH/AndroidProject/app/src/main/swift
if [ $expires == "NO" ]; then
  sed -i '' -e 's,fatalError("MUTATA_LICENSE"),MutataLicense.setLicenseKey("'"$license"'"),g' "$swift_android_dir/Sources/SwiftAndroid/AndroidAppDelegate.swift"
else
  sed -i '' -e 's,fatalError("MUTATA_LICENSE"),MutataLicense.setLicenseKey("'"$license"'"\,"'"$expires"'"),g' "$swift_android_dir/Sources/SwiftAndroid/AndroidAppDelegate.swift"
fi


android_app_gradle_file=$MUTATA_BUILD_PATH/AndroidProject/app/build.gradle

applicationId=$(cat $license_path | sed 's/.*"applicationId":"\{0,1\}\([^,"]*\)"\{0,1\}.*/\1/')
appVersionCode=$(cat $license_path | sed 's/.*"appVersionCode":"\{0,1\}\([^,"]*\)"\{0,1\}.*/\1/')
appVersionName=$(cat $license_path | sed 's/.*"appVersionName":"\{0,1\}\([^,"]*\)"\{0,1\}.*/\1/')

sed -i '' -e 's,MUTATA_GRADLE_APPLICATION_ID,'"$applicationId"',g' "$android_app_gradle_file"
sed -i '' -e 's,MUTATA_GRADLE_VERSION_CODE,'"$appVersionCode"',g' "$android_app_gradle_file"
sed -i '' -e 's,MUTATA_GRADLE_VERSION_NAME,'"$appVersionName"',g' "$android_app_gradle_file"

echo "Mutata License updated successfully!"
