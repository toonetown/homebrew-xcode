homebrew-xcode
==============

Homebrew tap with formulas and casks for installing Xcode, legacy SDKs, and other developer tools.


Installation
------------

To install: `brew tap toonetown/homebrew-xcode`.

**Note:** You will be unable to install the Xcode cask if you already have the appstore version installed.

Details
-------

The Xcode cask will be installed into `/Applications` (or wherever you have `--appdir` set).  The developer tool casks will be installed into `/Applications/Developer` (or within the `Developer` directory wherever you have `--appdir` set).

The legacy SDKs will be installed (on disk) in their individual `Cellar` directories, and they will be linked into `${HOMEBREW_PREFIX}/legacy-sdks`.  After each installation, they will also be linked into your Xcode installation using the `link-sdks` script.

**IMPORTANT:** If you are using the appstore version of Xcode, you must re-run `link-sdks` after *EVERY* upgrade to Xcode.  This step will be performed automatically if using the Xcode cask.


Downloads
---------

In order to use these formulas, you will need to download the binaries from Apple.  This can be done by logging in with your developer account at <https://developer.apple.com/downloads/> and then downloading the file.  You can view the exact file that will be downloaded by running `brew info` or `brew cask info` and looking in the `caveats` section.  Do not rename the files as you download them.

By default these formulas look for downloaded files in `${HOME}/Downloads` - so downloading them directly from the web will be sufficient.  However, you can set the environment variable `XCODE_DOWNLOAD_PATH` to any (full) URL and that will be used as the location for downloading the packages.  If you want to download from a different local directory, make sure and use the `file://` protocol in `XCODE_DOWNLOAD_PATH`.

The following is a list of downloads (and their locations) which need to be downloaded in order for all these formulas to work (i.e. if you want to run a private internal mirror).  In order to download these, you must be logged in to <https://developer.apple.com/downloads/>

|                         Name                          |               Download                | Used by                                                                                                           |
|-------------------------------------------------------|---------------------------------------|-------------------------------------------------------------------------------------------------------------------|
| Xcode 7.3.1                                           | [Xcode_7.3.1.dmg][]                   | *c:*`xcode`<br>(And latest SDKs)                                                                                  |
| Xcode 6.4                                             | [Xcode_6.4.dmg][]                     | *f:*`xc-sdk-osx-1010`<br>*f:*`xc-sdk-osx-109`<br>*f:*`xc-sdk-ios-8`                                               |
| Xcode 5.1.1                                           | [xcode_5.1.1.dmg][]                   | *f:*`xc-sdk-osx-108`<br>*f:*`xc-sdk-ios-7`                                                                        |
| <b>*</b>Xcode 4.6.3                                   | [xcode4630916281a.dmg][]              | *f:*`xc-sdk-osx-107`<br>*f:*`xc-sdk-ios-6`                                                                        |
| <b>*</b>Xcode 4.4.1                                   | [xcode_4.4.1_6938145.dmg][]           | *f:*`xc-sdk-ios-5`                                                                                                |
| <b>*</b>Xcode 3.2.6 and iOS SDK 4.3 for Snow Leopard  | [xcode_3.2.6_and_ios_sdk_4.3.dmg][]   | *f:*`xc-sdk-osx-106`<br>*f:*`xc-sdk-osx-105`<br>*f:*`xc-sdk-osx-104`<br>*f:*`xc-sdk-ios-4`<br>*f:*`xc-sdk-ios-3`  |
| Graphics Tools for Xcode 7.2                          | [Graphics_Tools_for_Xcode_7.2.dmg][]  | *c:*`icon-composer`                                                                                               |
| Auxiliary Tools for Xcode - Late July 2012            | [xcode44auxtools6938114a.dmg][]       | *c:*`packagemaker`                                                                                                |

<b>* Note:</b> The SDKs from these versions of Xcode are untested and may not work or link without additional patches or packages.  See how [this project](https://github.com/devernay/xcodelegacy/blob/master/XcodeLegacy.sh) handles compilers and patches for details.

The iOS SDKs include both `iPhoneOS` and `iPhoneSimulator` combined.  Only the last released version of each iOS major SDK is provided - which are:

 - iOS 8.4 (as `xc-sdk-ios-8`)
 - iOS 7.1 (as `xc-sdk-ios-7`)
 - iOS 6.1 (as `xc-sdk-ios-6`)
 - iOS 5.1 (as `xc-sdk-ios-5`)
 - iOS 4.3 (as `xc-sdk-ios-4`)
 - iOS 3.2 (as `xc-sdk-ios-3`)

[//]: # (Download links)
[Xcode_7.3.1.dmg]: http://adcdownload.apple.com/Developer_Tools/Xcode_7.3.1/Xcode_7.3.1.dmg
[Xcode_6.4.dmg]: http://adcdownload.apple.com/Developer_Tools/Xcode_6.4/Xcode_6.4.dmg
[xcode_5.1.1.dmg]: http://adcdownload.apple.com/Developer_Tools/xcode_5.1.1/xcode_5.1.1.dmg
[xcode4630916281a.dmg]: http://adcdownload.apple.com/Developer_Tools/xcode_4.6.3/xcode4630916281a.dmg
[xcode_4.4.1_6938145.dmg]: http://adcdownload.apple.com/Developer_Tools/xcode_4.4.1/xcode_4.4.1_6938145.dmg
[xcode_3.2.6_and_ios_sdk_4.3.dmg]: http://adcdownload.apple.com/Developer_Tools/xcode_3.2.6_and_ios_sdk_4.3__final/xcode_3.2.6_and_ios_sdk_4.3.dmg
[Graphics_Tools_for_Xcode_7.2.dmg]: http://adcdownload.apple.com/Developer_Tools/Graphics_Tools_for_Xcode_7.2/Graphics_Tools_for_Xcode_7.2.dmg
[xcode44auxtools6938114a.dmg]: http://adcdownload.apple.com/Developer_Tools/auxiliary_tools_for_xcode__late_july_2012/xcode44auxtools6938114a.dmg
