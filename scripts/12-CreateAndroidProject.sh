#!/bin/bash
set -e

if [ -z "$MUTATA_ROOT_PATH" ]
then
      echo -e "Please provide MUTATA_ROOT_PATH\nExample:\nexport MUTATA_ROOT_PATH=$PWD"
			exit -1
fi
source $MUTATA_ROOT_PATH/SetupEnv.sh


out_dir=$MUTATA_BUILD_PATH/AndroidProject

rm -rf $out_dir
mkdir -p $out_dir

cp -r $MUTATA_LIBS_PATH/MutataRunnerApp/ $out_dir

echo "Android project created successfully!"
