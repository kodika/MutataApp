# MutataApp

[Mutata.io](https://mutata.io) is the first framework that enables you to run Swift iOS applications on Android devices, without rewriting your code.

We have prepared automated scripts for every step needed to run your iOS project on an Android device.  

# Prepare your Mac
In order to build your Swift project for Android on your macOS machine, you will need to install some open-source programs and libraries first.  
Please check the [Prepare your Mac](docs/PrepareMac.md) section before using Mutata for the first time.

# Prepare and Run your project
To run your iOS project using Mutata, after you have [Prepared your Mac](docs/PrepareMac.md), you will also need to prepare your iOS project.
__Note:__ All of the scripts are explained in the detailed [Prepare your project](docs/PrepareProject.md) section.

```console

# Create a new folder and cd in it.

# MUTATA_IOS_SOURCES_PATH should be set to the path of your iOS Project
# Example: Mutata Showcase App
git clone https://github.com/kodika/Mutata-Showcase-App
export MUTATA_IOS_SOURCES_PATH=$PWD/Mutata-Showcase-App
# or use your own iOS Project
# export MUTATA_IOS_SOURCES_PATH=/path/to/your/ios/sources

# Your app's name without spaces and dashes
export MUTATA_SWIFT_MODULE_NAME="MutataShowcase"

# Clone this repo (MutataApp)
git clone https://github.com/kodika/MutataApp
cd MutataApp
export MUTATA_ROOT_PATH=$PWD

# (Optional) Prepare your Mac
./scripts/01-PrepareMac.sh

# Download Mutata Libs and Ndk
./scripts/02-DownloadLatestLibs.sh
./scripts/03-DownloadNdk.sh


# Prepare your Project
# Please make sure to run the commands in the correct order and only once.
# You can clean the generated files with ./scripts/30-CleanBuildFolder.sh

./scripts/12-CreateAndroidProject.sh
./scripts/14-CopyAndroidMutataLibs.sh
./scripts/15-ConvertIosProject.sh
./scripts/16-CreateSwiftPackageAndMutataFiles.sh
./scripts/17-CopyAndroidResFiles.sh
./scripts/18-CopyIosImagesAndXibs.sh
./scripts/40-DownloadFreeLicense.sh your@email.com
./scripts/19-UpdateMutataLicense.sh

# Connect Android Device or Launch Android Emulator

# Compile, Install and Run
./scripts/20-InstallAndRun.sh

# Enjoy!
```

## Edit your iOS Code
There is no need to run the whole process everytime you change something in your iOS Swift codebase.  
After you have edited your iOS Project using Xcode and have run it successfully in the iOS simulator, you can use these scripts to recompile and run your Android app.

```console
# cd in the folder they you have cloned MutataApp (this repo)
cd /path/to/MutataApp

# (Optional) Set environment variables if they are not already set.
# Custom Environment variables are usually cleared when Terminal is closed.
export MUTATA_ROOT_PATH=$PWD

# Path to your iOS Source code.
export MUTATA_IOS_SOURCES_PATH=/path/to/your/ios/sources

# Your app's name without spaces and dashes
export MUTATA_SWIFT_MODULE_NAME="YourAppsName"

# Run All-In-One script
./scripts/100-UpdateAndRun.sh

# or you can run each script individually
./scripts/15-ConvertIosProject.sh
./scripts/16-CreateSwiftPackageAndMutataFiles.sh
./scripts/18-CopyIosImagesAndXibs.sh
./scripts/19-UpdateMutataLicense.sh
./scripts/20-InstallAndRun.sh

```


## MUTATA_ROOT_PATH environment variable.
For Mutata scripts to work, clone this repo and then, set the __MUTATA_ROOT_PATH__ environment variable.  
__Note:__ You will need a new clone of the MutataApp repo for each of your iOS apps.  
__Note:__ You will need to set the environment variables every time you start the terminal, or change to a different iOS project.
