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


original_sources_path=$MUTATA_IOS_SOURCES_PATH
out_sources_path=$MUTATA_BUILD_PATH/iOSSources

rm -rf $out_sources_path
mkdir -p $out_sources_path

cp -r $original_sources_path $out_sources_path/Sources

pushd $out_sources_path > /dev/null
  $MUTATA_LIBS_PATH/swiftSelectorsRewriter --cleanObjc --IBActionSelectorsOutput IBActionsMutata.swift ./Sources
  mv IBActionsMutata.swift ./Sources-Android
  cp $MUTATA_TEMPLATES_PATH/NSObjectPerformSelectorClass.swift ./Sources-Android
  rm -rf ./Sources-Android/Assets.xcassets/AppIcon.appiconset
  rm -rf ./Sources-Android/Pods
popd > /dev/null

echo "Your iOS Project copied successfully!"
