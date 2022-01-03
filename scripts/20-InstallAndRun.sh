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

applicationId=$(cat $license_path | sed 's/.*"applicationId":"\{0,1\}\([^,"]*\)"\{0,1\}.*/\1/')

pushd $MUTATA_BUILD_PATH/AndroidProject > /dev/null

	gradle installDebug
	adb shell am start -n $applicationId/io.kodika.kodikaplayerandroid.MainActivity
popd > /dev/null
