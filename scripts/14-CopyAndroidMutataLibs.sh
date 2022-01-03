#!/bin/bash
set -e

if [ -z "$MUTATA_ROOT_PATH" ]
then
      echo -e "Please provide MUTATA_ROOT_PATH\nExample:\nexport MUTATA_ROOT_PATH=$PWD"
			exit -1
fi
source $MUTATA_ROOT_PATH/SetupEnv.sh


android_libs_dir=$MUTATA_BUILD_PATH/AndroidProject/app/libs/

mkdir -p $android_libs_dir
cp $MUTATA_LIBS_PATH/android-mutatalib-release/mutatalib-release.aar $android_libs_dir

echo "Android Mutata libraries copied successfully!"
