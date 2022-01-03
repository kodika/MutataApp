#!/bin/bash
set -e

if [ -z "$MUTATA_ROOT_PATH" ]
then
      echo -e "Please provide MUTATA_ROOT_PATH\nExample:\nexport MUTATA_ROOT_PATH=$PWD"
			exit -1
fi
source $MUTATA_ROOT_PATH/SetupEnv.sh


echo "Installing Android NDK r21e from Google..."
pushd $MUTATA_ROOT_PATH > /dev/null
  rm -rf android-ndk-r21e
  wget https://dl.google.com/android/repository/android-ndk-r21e-darwin-x86_64.zip
  unzip android-ndk-r21e-darwin-x86_64.zip
  rm android-ndk-r21e-darwin-x86_64.zip
popd > /dev/null

echo "Android NDK r21e installed successfully!"
