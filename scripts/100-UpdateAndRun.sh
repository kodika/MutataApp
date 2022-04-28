#!/bin/bash
set -e

if [ -z "$MUTATA_ROOT_PATH" ]
then
      echo -e "Please provide MUTATA_ROOT_PATH\nExample:\nexport MUTATA_ROOT_PATH=$PWD"
			exit -1
fi
source $MUTATA_ROOT_PATH/SetupEnv.sh

if [ -z "$MUTATA_IOS_SOURCES_PATH" ]
then
      echo -e "Please provide MUTATA_IOS_SOURCES_PATH\nexport MUTATA_IOS_SOURCES_PATH="
			exit -1
fi

swift_module_name=$MUTATA_SWIFT_MODULE_NAME

if [ -z "$swift_module_name" ]
then
      echo -e "Please provide MUTATA_SWIFT_MODULE_NAME\nExample:\nexport MUTATA_SWIFT_MODULE_NAME=\"MutataShowcase\""
			exit -1
fi

pushd $MUTATA_SCRIPTS_PATH > /dev/null
  ./15-ConvertIosProject.sh
  ./16-CreateSwiftPackageAndMutataFiles.sh
  ./18-CopyIosImagesAndXibs.sh
  ./19-UpdateMutataLicense.sh
  ./20-InstallAndRun.sh
popd > /dev/null
