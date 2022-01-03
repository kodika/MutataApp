#!/bin/bash
set -e

if [ -z "$MUTATA_ROOT_PATH" ]
then
      echo -e "Please provide MUTATA_ROOT_PATH\nExample:\nexport MUTATA_ROOT_PATH=$PWD"
			exit -1
fi
source $MUTATA_ROOT_PATH/SetupEnv.sh

swift_module_name=$MUTATA_SWIFT_MODULE_NAME

if [ -z "$swift_module_name" ]
then
      echo -e "Please provide MUTATA_SWIFT_MODULE_NAME\nExample:\nexport MUTATA_SWIFT_MODULE_NAME=\"MutataShowcase\""
			exit -1
fi


out_dir=$MUTATA_BUILD_PATH/AndroidProject/app/src/main/swift
template_files_dir=$MUTATA_TEMPLATES_PATH


echo "Generating Swift Package files for $swift_module_name"

echo "Creating Swift files at $out_dir"

rm -rf $out_dir
mkdir -p $out_dir

cp -r $template_files_dir/SwiftPackage/ $out_dir

sed -i '' -e 's,SWIFT_MODULE_NAME,'"$swift_module_name"',g' "$out_dir/Package.swift"

sed -i '' -e 's,SWIFT_MODULE_NAME,'"$swift_module_name"',g' "$out_dir/Sources/SwiftAndroid/AndroidAppDelegate.swift"
sed -i '' -e 's,SWIFT_MODULE_NAME,'"$swift_module_name"',g' "$out_dir/Sources/SwiftAndroid/Nib2UIKit+Nib2UIKitPackageNameProtocol.swift"


out_sources_path=$MUTATA_BUILD_PATH/iOSSources
cp $template_files_dir/SourcesPackage.swift $out_sources_path/Package.swift

sed -i '' -e 's,SWIFT_MODULE_NAME,'"$swift_module_name"',g' "$out_sources_path/Package.swift"

echo "Swift Mutata Package created successfully!"
