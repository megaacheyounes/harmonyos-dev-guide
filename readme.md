# HarmonyOS LiteWearable Development Guide (unofficial)

## Introduction

Welcome to the **HarmonyOS LiteWearable Development Guide**! This guide will walk you through the steps required to develop applications for Huawei's HarmonyOS devices and **LiteWearable devices**. The guide includes setting up the development environment, creating an app, and building a simple one-screen application to fetch and display the user's location.

---

## Disclaimer

This guide is not an official resources. It has not being reviewed nor approved by Huawei.

Its meant to help developers get started with HarmonyOS development quickly without referring to the lengthy and complex official documentation.

This guide will mostly focus on developing for Huawei LiteWearables (Watch GT series) and can apply to other Huawei devices.

Please refer to the official documentation for more up-to-date and accurate information: [official HarmonyOS documentation](https://developer.harmonyos.com/en/docs/documentation)

## Contribution

> **This guide is not complete. Its being actively developed and maintained, more content and information will be added soon!**

All kind of contributions are welcome!

If you find any mistakes or inaccurate information, please do [create and issue](https://github.com/megaacheyounes/harmonyos-dev-guide/issues/new) or feel free to open a pull request. I would be very thankful

---

## Table of Contents

- [HarmonyOS LiteWearable Development Guide (unofficial)](#harmonyos-litewearable-development-guide-unofficial)
  - [Introduction](#introduction)
  - [Disclaimer](#disclaimer)
  - [Contribution](#contribution)
  - [Table of Contents](#table-of-contents)
  - [Requirements](#requirements)
    - [Environment](#environment)
    - [**Other Tools**](#other-tools)
    - [**Testing device**](#testing-device)
  - [Creating and Configuring an App on Huawei AppGallery Console](#creating-and-configuring-an-app-on-huawei-appgallery-console)
    - [1. **Create an App on AppGallery Connect**](#1-create-an-app-on-appgallery-connect)
    - [1. **Configure APIs and Permissions**](#1-configure-apis-and-permissions)
    - [1. **Download the JSON Configuration File**](#1-download-the-json-configuration-file)
  - [HarmonyOS vs HarmonyOS NEXT](#harmonyos-vs-harmonyos-next)
  - [Developing sammple app for LiteWearable (using web languages)](#developing-sammple-app-for-litewearable-using-web-languages)
    - [1. **Project Creation in DevEco Studio**](#1-project-creation-in-deveco-studio)
    - [2. **Fetching User Location**](#2-fetching-user-location)
      - [Step 1: Set Required Permissions](#step-1-set-required-permissions)
      - [Step 2: Implement the Location Fetching Logic](#step-2-implement-the-location-fetching-logic)
      - [Step 3: Design the UI](#step-3-design-the-ui)
  - [Configure the singing config](#configure-the-singing-config)
  - [Running the App](#running-the-app)
    - [Running on Simulator](#running-on-simulator)
    - [Running on a Physical Device](#running-on-a-physical-device)
    - [automated installation](#automated-installation)
  - [Release](#release)
  - [common installation error](#common-installation-error)
    - [INSTALLATION FAILED: 10. Internal error](#installation-failed-10-internal-error)
    - [INSTALLATION FAILED: 31. failed to verify signature](#installation-failed-31-failed-to-verify-signature)
  - [Important consideration when developing for LiteWearables](#important-consideration-when-developing-for-litewearables)
  - [Additional Resources](#additional-resources)
  - [Technical Support](#technical-support)
  - [Conclusion](#conclusion)

---

## Requirements

### Environment

Before starting development, ensure your system meets the following requirements:

- [ ] **Huawei Developer account**: Huawei Developer account is required to access all Huawei services, and is required to run HarmonyOS app on a HarmonyOS device: [Register a Developer Acount](https://developer.huawei.com/consumer/en/doc/start/registration-and-verification-0000001053628148)

- [ ] **DevEco Studio** : DevEco Studio is the official IDE for HarmonyOS development. Download and install the latest version of DevEco Studio using the following link: [Download DevEco Studio](https://developer.huawei.com/consumer/cn/deveco-studio/archive/)

- [ ] **HarmonyOS SDK**: The HarmonyOS SDK provides essential tools, libraries, and APIs for development. You can download SDK from within DevEco studio by going to **Tools** > **SDK Manager**, it is recommended to download SDK 3.0.0 (API 8) or newer You can install the SDK from within DevEco Studio after setting it up: [Install HarmonyOS SDK](https://developer.harmonyos.com/en/docs/documentation/doc-guides/ide-toolkit-0000001070643051)

- [ ] **Node.js**: Node.js is required for JavaScript-based HarmonyOS development. Its usually installed by DevEco studio, but you can also Download and install it from the official website: [Download Node.js](https://nodejs.org/en/download/)

### **Other Tools**

- [ ] **JDK 1.8 or later**: Ensure you have the Java Development Kit installed.
- [ ] **Git**: Version control tool for managing your codebase.

### **Testing device**

To be able to run the app on physical watch, you need:

- [ ] **Huawei Health**: Huawei health is required for LiteWearable (GT series), download it from AppGallery on your Huawei phone. for other Android phone, you have to download the APK from: [https://consumer.huawei.com/ae-en/mobileservices/health/](Huawei Health)

### Download SDK manually 

If you can't download the SDK through DevEco IDE, you can manually downlod the SDK from Google Drive, API 6 only For MS Windows (For MacOS or other APIs, please create an issue and I will look into it)

1. download the SDK: [Google Drive Link](https://drive.google.com/file/d/1csHeNMpfn127kCwJa6XGwft4epv84MD5/view?usp=drive_link)
2. unzip the archive into a folder (example: `D:\_HarmonyOS\sdk_api6`)
3. Open DevEco Studio, go to **File** > **Settings** > **SDK**, then click **Edit** and select the folder where you have unzipped the archive (`D:\_HarmonyOS\sdk_api6`)
4. 
![image](https://github.com/user-attachments/assets/bdc0e9df-98cc-42c9-8534-273b7cc10cd6)

---

## Creating and Configuring an App on Huawei AppGallery Console

To develop and distribute your HarmonyOS LiteWearable app, you must first configure the app on the **Huawei AppGallery Console**. Follow these steps to create your app:

### 1. **Create an App on AppGallery Connect**

- Log in to the [AppGallery Console](https://developer.huawei.com/consumer/en/service/josp/agc/index.html) and navigate to "My Apps."
- Click on **"Create App"** and follow the prompts to enter the app details.
- Select **HarmonyOS** as the platform.
- After creating the app, note the **App ID** as it will be required for development.

### 1. **Configure APIs and Permissions**

- In AppGallery Connect, go to **"Manage APIs"** and enable necessary APIs such as **Location Services**.
- Set appropriate permissions for accessing device location in the **App Info** section.

### 1. **Download the JSON Configuration File**

After setting up APIs, download the **agconnect-services.json** file and place it in the root directory of your project.

---

## HarmonyOS vs HarmonyOS NEXT

HarmonyOS which was a dual-framework OS (HarmonyOS + Android) is replaced with HarmonyOS NEXT, which is Huawei's first truly independent operating system.

If you are just starting developing for Huawei devices, it may be a better idea to start with HarmonyOS NEXT, as HarmonyOS is being phased out.

| Feature                       | HarmonyOS                                                         | HarmonyOS NEXT                                                                                                                                                                                                                                                                                                                                                |
| ----------------------------- | ----------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Platform Type**             | Multi-device OS (phones, tablets, smart TVs, IoT, etc.)           | Designed primarily for smart devices, specifically aiming at mobile phones initially                                                                                                                                                                                                                                                                          |
| **Code Compatibility**        | Supports Android apps via compatibility layer (e.g., APK support) | Doesn't support Android APKs, uses its own application framework called ArkUI                                                                                                                                                                                                                                                                                 |
| **App Development Framework** | JavaScript/Java and HarmonyOS UI framework                        | Javascript and ArkUI, which uses TypeScript and declarative UI similar to Flutter                                                                                                                                                                                                                                                                             |
| **Open Source**               | Partially open-source (OpenHarmony)                               | Fully open-source version of HarmonyOS                                                                                                                                                                                                                                                                                                                        |
| **Market Focus**              | Wide range of devices (phones, tablets, wearables)                | Everything included in harmonyOS and more (e.g cars infotainment systems), and soon to include all Huawei devices including IoT devices (e.g speakers, smart airfryer, smart curtains..). Initially focused on mobile but quickly supporting other device types, HarmonyOS NEXT is designed to be independent mobile ecosystem competing with Android and iOS |
| **App Store**                 | Huawei AppGallery and other Android-compatible app stores         | HarmonyOS NEXT-specific app store, targeting apps built on ArkUI and native frameworks                                                                                                                                                                                                                                                                        |
| **Backward Compatibility**    | Compatible with existing HarmonyOS 2.x/3.x devices                | Not backward compatible with older HarmonyOS devices or Android apps                                                                                                                                                                                                                                                                                          |
| **Development Language**      | JavaScript, Java, C/C++                                           | ArkTs, ArkUI, and C/C++ with ArkCompiler                                                                                                                                                                                                                                                                                                                      |

> The above mentioned differences does not apply to LiteWearables, you still have to use Javascript for development, the project structure may change but end-user will have same User experience.

---

## Developing sammple app for LiteWearable (using web languages)

This section describes how to create sample app for fetching user's location on Huawei LiteWearable device (smart sportswatch)

### 1. **Project Creation in DevEco Studio**

Follow these steps to create a project in DevEco Studio:

1. Open **DevEco Studio**.
2. Click on **"New Project"** and choose **HarmonyOS Wearable** as the template.
3. Enter the project details such as **Package Name (bundle name)**, **App Name**, and **API Level**.

### 2. **Fetching User Location**

In this example, we'll demonstrate how to fetch and display the user's location using the HarmonyOS `Location` API.

#### Step 1: Set Required Permissions

In your `config.json` file, declare the following permissions:

```json
{
  "permissions": ["ohos.permission.LOCATION"]
}
```

#### Step 2: Implement the Location Fetching Logic

Create a new `index.js` file and add the following code to fetch the user's location:

```javascript
import geolocation from "@system.geolocation";
import prompt from "@system.prompt";

export default {
  data: {
    latitude: null,
    longitude: null,
  },
  onInit() {
    this.getLocation();
  },
  getLocation() {
    geolocation.getLocation({
      success: (location) => {
        this.latitude = location.latitude;
        this.longitude = location.longitude;
        prompt.showToast({
          message: `Location: ${this.latitude}, ${this.longitude}`,
        });
      },
      fail: (error) => {
        prompt.showToast({
          message: `Error: ${error.message}`,
        });
      },
    });
  },
};
```

#### Step 3: Design the UI

In your `index.hml` file, design the user interface to display the location:

```hml
<template>
  <div class="container">
    <text class="location-label">Your Location:</text>
    <text class="location-value">Latitude: {{latitude}}</text>
    <text class="location-value">Longitude: {{longitude}}</text>
  </div>
</template>
```

In `index.css`:

```css
<style>
.container {
  height:100%;
  width:100%;
  display:flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}
.location-label, .location-value {
  font-size: 18px;
  color: #333;
  margin: 10px;
}
</style>
```

---

## Configure the singing config

Before running or releasing the app, you must setup the signing configuration, which is annoyingly lengthy and complicated, it has been documented in the separate file: [signature_configuration.md](https://github.com/megaacheyounes/harmonyos-dev-guide/blob/master/signing_config.md)

## Running the App

### Running on Simulator

1. In **DevEco Studio** device selector, choose **Device Manager**.
2. Select **Wearable Emulator** and create a new wearable simulator.
3. Build and run the project on the simulator.
4. Use the simulator tools to test features such as **Location Services**.

### Running on a Physical Device

1. **Enable Developer Options** on your HarmonyOS LiteWearable device:
   - Go to **Settings** > **About Device** and tap **Build Number** multiple times to enable Developer Mode.
2. Connect your phone to your computer via USB.
3. In **DevEco Studio**, go To **Build** -> **build HAP(s) & APP(s)** -> **build APP(s)**.
4. Locate the app debug package `.hap` at `/build/output/default/entry-default-signed.hap`.
5. send the package to your phone at path `/sdcard/haps`: `adb push entry-default-signed.hap /sdcard/haps` or `hdc file push entry-default-signed.hap /sdcard/haps`
6. open DevEco Assistant App on your phone, go to Apps, then click **install**
7. after successful installation, start the app manually on the watch

### automated installation

Building the app, moving the package to you phone and manually installing each time, is a hustle and can slow development, but you can use the scripts in `/scripts` to automate that.

1. copy `scripts/ADB_RUN.bat` (or `scripts/HDC_RUN.bat`) to your project
2. open the script and update the variables `node` and `hvigor` based on your DevEco studio installation location
3. connect your phone to your PC via USB and make sure its unlocked and USB debugging is is enabled
4. open a terminal or CMD, and run the script: `$ ./ADB_RUN.bat`

> if the script fail to click the install button on your phone, then update the screen coordinates of the install button
> at line 48: adb shell input tap <position-x> <position-y>

## Release

> you can not install release app on the watch manually, release and debug APK usually are the same, the only difference is the signature

1. Configure release signature
2. Build release `.app` package, in DevEco studio: go To **Build** > **build HAP(s) & APP(s)** > **build APP(s)**
3. find the `.app` package in `/build/output/default/entry-default-signed.app`
4. Go To AppGallery console -> apps -> HarmonyOS -> <app name> -> new Version
5. update package, fill in 'whats new' and submit

Detailed instructions here: [Releasing a HarmonyOS App](https://developer.huawei.com/consumer/en/doc/app/agc-help-harmonyos-releaseapp-0000001914554900)

---

## common installation error

<!-- todo: move to separate file -->

### INSTALLATION FAILED: 10. Internal error

Common reason for this error include:

1. Using API version that's not supported by the device, lower the API level in `build-profile.json5` and try again.
2. Using advance or modern JS features/syntax that are not supported by the LiteWearable device, example

```js
const [var1, var2] = "11:20".split(":");
```

3. Missing resources like **icon**, or using a **string** resource that do not exist

### INSTALLATION FAILED: 31. failed to verify signature

This more of a bug that an error, some ways to solve this:

1. restart the watch, restart Huawei Health app and DevEco assistant app
2. Generate new debug signing config
3. Ensure that the watch's UDID is included in the profile file `.p7b`

> more errors will be added soon

---

## Important consideration when developing for LiteWearables

Its important to keep these points in mind when developing for HarmonyOS LiteWearables:

1. LiteWearable may have 1GB memory or less, each page (screen) has 48 KB size limit
2. LiteWearable devices may have 32 GB storage only, the package (.hap) can not be bigger than 10MB
3. use `.jpg` instead of `.png` whenever is possible, and use resolution of 454x454 pixels
4. navigation Router do not have back stack, you can't navigate back, design your app accordingly
5. app may get interrupted randomly, use lifecycle methods to update data and UI when a screen is shown
6. break down large classes into separate files, each function in a separate file, to reduce overall page size
7. code is executed during runtime not compiled, you have to optimize the code and remove unused code/imports manually
8. many system features are not available or limited on LiteWearable due to limited resources, like Alarm, playing videos and audio, picking files, and many more
9. app can not run in the background, and cannot be resumed in the same state after re-launching it from history stack

## Additional Resources

- [HarmonyOS tips](https://github.com/megaacheyounes/harmonyos-dev-guide/blob/master/tips.md)
- [HarmonyOS Documentation](https://developer.harmonyos.com/en/docs/documentation)
- [HarmonyOS development documentation](https://developer.huawei.com/consumer/en/doc/harmonyos-guides-V5/application-dev-guide-V5)
- [HarmonyOS LiteWearable documentation (javascript)](https://developer.huawei.com/consumer/en/doc/harmonyos-references-V2/js-components-common-attributes-0000001427744868-V2)
- [DevEco Studio documentation](https://developer.huawei.com/consumer/en/doc/harmonyos-guides-V5/ide-tools-overview-V5)
- [Huawei LiteWearable API Reference](https://developer.harmonyos.com/en/docs/documentation/doc-guides/wearable-overview-0000001054916109)
- [AppGallery Connect Documentation](https://developer.huawei.com/consumer/en/doc/development/AppGallery-connect-Guides/agc-get-started-0000001053628149)

---

## Technical Support

1. Ask the community: [Huawei Developer Forum](https://forums.developer.huawei.com/forumPortal/en/home)
2. Create a support ticket: [Huawei developer support](https://developer.huawei.com/consumer/en//support/feedback/)
3. Reach out to: [younes.megaache@huawei.com](mailto:younes.megaache@huawei.com)

## Conclusion

You are now set up to start developing applications for Huawei HarmonyOS and HarmonyOS LiteWearable devices. This guide covered the basic setup, signature configuration, running on simulators and physical devices, and a simple example to fetch the user's location. For more advanced use cases, refer to the official documentation and API references.

Happy coding!

> [Younes Megaache](https://younes-megaache.com)
