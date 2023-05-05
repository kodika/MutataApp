## MUTATA_ROOT_PATH environment variable.
For Mutata scripts to work, clone this repo and then, set the __MUTATA_ROOT_PATH__ environment variable.  
__Note:__ You will need a new clone of this repo for each of your iOS apps.  
__Note:__ You will need to set the environment variables every time you start the terminal, or change to a different iOS project.
```console
# Clone the repo
git clone https://github.com/kodika/MutataApp

# Change Directory to the MutataApp.
cd MutataApp

# Set environment variable to current directory
export MUTATA_ROOT_PATH=$PWD
```

## Download Pre-configured Android project

To create your .apk, you will need an Android Project which will include your Android Manifest, your assets, and the compiled Swift libraries. These have been pre-configured in a project which is provided with Mutata.  After you have successfully run all the scripts, your configured Android project will be in `./build/AndroidProject`

```console
./scripts/12-CreateAndroidProject.sh
```

## Copy Android Mutata Libs
Copy precompiled Android .aar libraries to your Android Project.
```console
./scripts/14-CopyAndroidMutataLibs.sh
```

## Convert your iOS Project
__Note:__ Even though we do not change your iOS code, we strongly recommend backup/pushing your code or using a copy/clone of your iOS project.  
Before running the next script, please set the **MUTATA_IOS_SOURCES_PATH** environment variable to the root path of your iOS project .swift files.

This script will copy your iOS Sources from **MUTATA_IOS_SOURCES_PATH** to `./build/iOSSources` and then will execute the `swiftSelectorsRewriter`.
`swiftSelectorsRewriter` creates `IBActionsMutata.swift` file needed to run your IBActions and all your @objc selectors, as they are not supported in Swift.
In addition, all __@objc, @IBOutlets, @IBActions__, etc. attributes will be converted as the Swift compiler does not officially support them so, Mutata uses `swiftSelectorsRewriter` to do that.
Finally, `swiftSelectorsRewriter` will delete your copied __AppIcon.appiconset__ as you need to create a separate Android logo.

```console
export MUTATA_IOS_SOURCES_PATH=/path/to/your/ios/sources
./scripts/15-ConvertIosProject.sh
```

## Create Package.swift
Mutata uses the Swift Package Manager to compile your Swift code and link it with the Mutata libraries.

Set the __MUTATA_SWIFT_MODULE_NAME__ environment variable with the name of your iOS app. This name will not be visible to the users.   
__Note:__ Please remove all whitespaces or replace them with underscores(_).
```console
export MUTATA_SWIFT_MODULE_NAME="NameOfYourApp"
./scripts/16-CreateSwiftPackageAndMutataFiles.sh
```
This script will create a new `Package.swift` file at `./out/AndroidProject/app/src/main/swift`, which will be used by Gradle to compile your Swift code and include it in the Android .apk.
It will also copy three swift files, which are necessary to connect your Swift code with Mutata iOS and Android Libraries.
Finally, it will create another `Package.swift` in your iOS Sources folder, which Mutata's Package.swift will depend on.


## Copy Android resource default files
Copy temporary Android resources like Logo and App Name. You can replace them later.
```console
./scripts/17-CopyAndroidResFiles.sh
```


## Copy your iOS Images and xibs
Copy your iOS resources like Images, xibs, and storyboards from `iOSSources` to `AndroidProject`.
```console
./scripts/18-CopyIosImagesAndXibs.sh
```

## Download Mutata License
There are 2 types of Mutata Licenses.
- __Free:__ Only to test your iOS app in Android.
- __Paid:__ Release your app to the Play Store or device.

### Download a Free License
You can download a free license to test your app using the `40-DownloadFreeLicense.sh` script with your email as an argument, or contact us at license[@]mutata.io
```console
./scripts/40-DownloadFreeLicense.sh your@email.com
```

### Purchase a Mutata License
You can purchase your Mutata license from [Mutata.io](https://mutata.io/#pricing) or contact us at license[@]mutata.io

## Use Mutata License
To use your license, you will need to update it in the `AndroidAppDelegate.swift`.

### Automatic License update
After downloading a free license or purchasing one, you need to run
```console
./scripts/19-UpdateMutataLicense.sh
```
to automatically update your `AndroidAppDelegate.swift` with the license code.

### Manual License update
Open the `AndroidAppDelegate.swift` in `./build/AndroidProject/app/src/main/swift/Sources/SwiftAndroid/AndroidAppDelegate.swift` and insert your Mutata License at the beginning of the
`public override func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool` function

```Swift
MutataLicense.setLicenseKey("YOUR_LICENSE_CODE") ///Paid
MutataLicense.setLicenseKey("YOUR_LICENSE_CODE","1640908800") ///Free
```

## Android Device - Android Emulator
Mutata will compile your apps for both Android Device and Android Emulator architectures.

### Connect Android Device
Connect your Android Device to your Mac and [enable Developer Mode and USB Debugging](https://developer.android.com/studio/run/device).

### Launch Android Emulator
You can launch an Android Emulator from [Android Studio -> AVD Manager](https://developer.android.com/studio/run/emulator) or from [Command Line](https://developer.android.com/studio/run/emulator-commandline).

## Compile, Install and Run
Mutata uses `gradle` and `adb` to build and run your Android projects.

You can run the following script and wait for the app to launch on your device or emulator.
```console
./scripts/20-InstallAndRun.sh
```

### Manual compile
You can also manually build your apk with
```console
cd ./out/AndroidProject
gradle installDebug
```
and then launch it either from the home screen of your device, or Manually run it with
```console
adb shell am start -n YOUR_APPLICATION_ID/io.kodika.kodikaplayerandroid.MainActivity
```
