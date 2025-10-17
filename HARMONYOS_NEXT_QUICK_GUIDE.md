# HarmonyOS Next: Build & Release Quick Guide

This is a quick guide to configure and release ArkTS project to AppGallery.

---

## Development Environment Setup

Get your local machine ready for development.

### 1. Install IDE & SDK

First, **install DevEco Studio Next**. Once it's running, open `File > Settings > OpenHarmony SDK`. From there, download the latest **API Version** SDK (at least API 18).  
[DevEco Studio Installation Guide](https://developer.huawei.com/consumer/en/doc/harmonyos-guides/ide-software-install)

### 2. Open the Project

Use `File > Open` and select the project's root folder. Let the IDE sync and index the files.

### 3. Run & Debug

You can run the app on an emulator or a real device.

- **Emulator:** Launch a remote emulator directly from the IDE's device menu.
- **Physical Device:** setup singing config, connect your device and select it as the deployment target.  
  [Debugging your app (HarmonyOS)](https://developer.huawei.com/consumer/en/doc/app/agc-help-debug-overview-0000001955332054)

---

## Releasing to AppGallery

This process involves creating a release build signed with release certificates.

### 1. Developer Account & App Creation

1. **Register as a Developer and verify identity**

   [Registering a HUAWEI ID and Applying for the HUAWEI ID Service](https://developer.huawei.com/consumer/en/doc/connectivity-Guides/registering-applying-account-0000001050818011).

2. **Create a New App in AppGallery Connect**

   Add app details such as name, package ID: [Creating HarmonyOS App](https://developer.huawei.com/consumer/en/doc/app/agc-help-create-app-0000002247955506).

> **Note:** The **Package Name** you set in AGC _must_ match the `bundleName` in your project's `/AppScope/app.json5` file.

### 2. Generate Signing Credentials

You need a certificate and a profile to sign the release build.

- In AGC, navigate to `Certificates,  app IDS and profiles > Certificates`.
- Click `Add` and follow instructions to request a new **release certificate** (`.cer`)
- Navigate to `Profiles`, click `Add` and follow instructions to request a **release profile** (`.p7b`).

[Requesting a Release Certificate](https://developer.huawei.com/consumer/en/doc/app/agc-help-add-releasecert-0000001946273961)

[Requesting a Release Profile](https://developer.huawei.com/consumer/en/doc/app/agc-help-add-releaseprofile-0000001914714796)

> Requesting Certificate `.cer` requires `Certificate Signing Request (CSR)` file, which can be generated using DevEco IDE: [Generate Key and CSR](https://developer.huawei.com/consumer/en/doc/harmonyos-guides/ide-signing#section462703710326)

### 3. Configure Signing in DevEco Studio

With the credentials from AGC, you can now configure the IDE.

1.  In DevEco Studio, go to `File > Project Structure > Signing Configs`.
2.  Select your singing config file, including **Certificate (`.cer`)**, **profile (`.p7b`)**, **keystore (`.p12`)**, and enter the keystore credentials.

### 4. Build the Signed App Package

Navigate to `Build > Build Hap(s)/APP(s) > Build APP(s)`. The IDE will use your configured signing credentials to generate a release-ready package.

The signed release build `.app` will be located in the `build/outputs/default/` directory.

### 5. Upload and Submit for Review

In AppGallery Connect, go to your app's release page, add your app information like name, icon, screenshots..etc, upload the `.app` package , and **submit for review**.

[Releasing a HarmonyOS App](https://developer.huawei.com/consumer/en/doc/app/agc-help-release-app-0000002271695230)

---

## Quick References

### DevEco Studio IDE

**Purpose:** Official IDE for HarmonyOS app development.
**Documentation:**

- [Overview](https://developer.huawei.com/consumer/en/doc/harmonyos-guides-V5/ide-tools-overview-V5)
- [Installation Guide](https://developer.huawei.com/consumer/en/doc/harmonyos-guides/ide-software-install-V13)

### HarmonyOS Next (ArkTS / ArkUI)

**Purpose:** TypeScript-based development framework for HarmonyOS smartwatches.
**Documentation:**

- [ArkTS Introduction](https://developer.huawei.com/consumer/en/doc/harmonyos-guides-V5/arkts-get-started-V5)
- [ArkUI Overview](https://developer.huawei.com/consumer/en/doc/harmonyos-guides-V5/arkui-overview-V5)

### Huawei AppGallery Connect

**Purpose:** Manage app configuration, signing, and release.
**Documentation:**

- [Configure and Sign Release](https://developer.huawei.com/consumer/en/doc/harmonyos-guides/ide-publish-app#section6406135115814)
- [Create Wearable App](https://developer.huawei.com/consumer/en/doc/app/agc-help-createharmonyapp-0000001945392297)
- [Release App](https://developer.huawei.com/consumer/en/doc/app/agc-help-harmonyos-releaseapp-0000001914554900)

### Developer Forum

**Purpose:** Technical support and discussions for HarmonyOS wearable development.
[Huawei Developer Forum](https://forums.developer.huawei.com/forumPortal/en/home?search=wearable)
