#!/bin/bash
set -e

if [ -z "$MUTATA_ROOT_PATH" ]
then
      echo -e "Please provide MUTATA_ROOT_PATH\nExample:\nexport MUTATA_ROOT_PATH=$PWD"
			exit -1
fi
source $MUTATA_ROOT_PATH/SetupEnv.sh

rm -rf $MUTATA_LIBS_PATH
mkdir -p $MUTATA_LIBS_PATH

pushd $MUTATA_LIBS_PATH > /dev/null
  curl -s https://api.github.com/repos/kodika/MutataLibraries/releases/latest \
  | grep "browser_download_url.*zip" \
  | cut -d : -f 2,3 \
  | tr -d \"  \
  | wget --show-progress  -qi -

  unzip swiftSelectorsRewriter.zip
  unzip android-mutatalib-release.zip
  unzip swift-android-5.4.zip
  unzip swift-android-5.4-r1.zip
  unzip MutataRunnerApp.zip

  rm swift-android-5.4.zip
  rm swift-android-5.4-r1.zip
  rm swiftSelectorsRewriter.zip
  rm android-mutatalib-release.zip
  rm MutataRunnerApp.zip

  xattr -r -d com.apple.quarantine ./swift-android-5.4-r1/ 2>/dev/null

popd > /dev/null

echo "Mutata libraries downloaded successfully!"
