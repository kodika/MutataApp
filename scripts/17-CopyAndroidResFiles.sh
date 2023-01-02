#!/bin/bash
set -e

if [ -z "$MUTATA_ROOT_PATH" ]
then
      echo -e "Please provide MUTATA_ROOT_PATH\nExample:\nexport MUTATA_ROOT_PATH=$PWD"
			exit -1
fi
source $MUTATA_ROOT_PATH/SetupEnv.sh

mkdir -p $MUTATA_BUILD_PATH/iOSFiles/res
cp -r $MUTATA_TEMPLATES_PATH/AndroidRes/res/ $MUTATA_BUILD_PATH/iOSFiles/res

echo "Android resources copied successfully!"
