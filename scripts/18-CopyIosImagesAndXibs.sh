#!/bin/bash
set -e

if [ -z "$MUTATA_ROOT_PATH" ]
then
      echo -e "Please provide MUTATA_ROOT_PATH\nExample:\nexport MUTATA_ROOT_PATH=$PWD"
			exit -1
fi
source $MUTATA_ROOT_PATH/SetupEnv.sh


ios_files_dir=$MUTATA_BUILD_PATH/iOSFiles

rm -rf $ios_files_dir/copiedFromPackage/

destinationXibsDir=$ios_files_dir/copiedFromPackage/assets #Nib2UIKit needs them in first level in assets
destinationFontsDir=$ios_files_dir/copiedFromPackage/assets/fonts
destinationImagesDir=$ios_files_dir/copiedFromPackage/images/drawable

mkdir -p $destinationXibsDir
mkdir -p $destinationFontsDir
mkdir -p $destinationImagesDir

find $MUTATA_BUILD_SWIFT_SOURCES_ANDROID_PATH -name '*.xib' -exec cp -pr '{}' $destinationXibsDir ';'
find $MUTATA_BUILD_SWIFT_SOURCES_ANDROID_PATH -name '*.storyboard' -exec cp -pr '{}' $destinationXibsDir ';'
find $MUTATA_BUILD_SWIFT_SOURCES_ANDROID_PATH -name '*.png' -exec cp -pr '{}' $destinationImagesDir ';'
find $MUTATA_BUILD_SWIFT_SOURCES_ANDROID_PATH -name '*.ttf' -exec cp -pr '{}' $destinationFontsDir ';'
find $MUTATA_BUILD_SWIFT_SOURCES_ANDROID_PATH -name '*.otf' -exec cp -pr '{}' $destinationFontsDir ';'

find -s $ios_files_dir/copiedFromPackage/ -type f -exec md5 -q {} \; | md5 > $ios_files_dir/copiedFromPackage/assets/assets.version

pushd $destinationImagesDir > /dev/null

	for file in *.png; do
		if [ -f "${file}" ]; then
			#Replace whitespaces
			filename=$(echo $file | tr ' ' '_');

			filename="${file%.*}";
			extension="${file##*.}";

			#Lowercase all file names
			filename=$(echo $filename | tr '[A-Z]' '[a-z]');
			#Replace all invalid characters with underscore
			filename=$(echo $filename | sed -e 's/[^a-z0-9_]/_/g');

			if [[ $filename =~ ^[0-9] ]]; then
				filename="_${filename}"
			fi

			mv "$file" "${filename}.${extension}";
		fi
	done

	for file in *.jpg; do
		if [ -f "${file}" ]; then
			#Replace whitespaces
			filename=$(echo $file | tr ' ' '_');

			filename="${file%.*}";
			extension="${file##*.}";

			#Lowercase all file names
			filename=$(echo $filename | tr '[A-Z]' '[a-z]');
			#Replace all invalid characters with underscore
			filename=$(echo $filename | sed -e 's/[^a-z0-9_]/_/g');

			if [[ $filename =~ ^[0-9] ]]; then
				filename="_${filename}"
			fi

			mv "$file" "${filename}.${extension}";
		fi
	done

popd > /dev/null

echo "iOS Assets copied successfully!"
