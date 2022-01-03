#!/bin/bash

if [ -z "$MUTATA_ROOT_PATH" ]
then
      echo -e "Please provide MUTATA_ROOT_PATH\nExample:\nexport MUTATA_ROOT_PATH=$PWD"
			return -1
fi

export MUTATA_SCRIPTS_PATH=$MUTATA_ROOT_PATH/scripts
export MUTATA_TEMPLATES_PATH=$MUTATA_ROOT_PATH/template_files
export MUTATA_BUILD_PATH=$MUTATA_ROOT_PATH/build
export MUTATA_LIBS_PATH=$MUTATA_ROOT_PATH/mutata_libs

export MUTATA_BUILD_SWIFT_SOURCES_ANDROID_PATH=$MUTATA_BUILD_PATH/iOSSources/Sources-Android



export JAVA_HOME=$(/usr/libexec/java_home --version 1.8)
export TOOLCHAINS=org.swift.540202104261a

export ANDROID_NDK_HOME=$MUTATA_ROOT_PATH/android-ndk-r21e
export NDK_ROOT=$ANDROID_NDK_HOME
export ANDROID_NDK=$ANDROID_NDK_HOME
export ANDROID_NDK_ROOT=$ANDROID_NDK_HOME

export SWIFT_ANDROID_HOME=$MUTATA_LIBS_PATH/swift-android-5.4-r1
