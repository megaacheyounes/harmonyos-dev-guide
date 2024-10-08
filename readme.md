# HarmonyOS LiteWearable Development Guide

## Introduction

Welcome to the **HarmonyOS LiteWearable Development Guide**! This guide will walk you through the steps required to develop applications for Huawei's **LiteWearable devices** running HarmonyOS. The guide includes setting up the development environment, creating an app, and building a simple one-screen application to fetch and display the user's location.

---

## Table of Contents

- [HarmonyOS LiteWearable Development Guide](#harmonyos-litewearable-development-guide)
  - [Introduction](#introduction)
  - [Table of Contents](#table-of-contents)
  - [Requirements](#requirements)
    - [4. **Other Tools**](#4-other-tools)
  - [Creating and Configuring an App on Huawei AppGallery Console](#creating-and-configuring-an-app-on-huawei-appgallery-console)
    - [1. **Create an App on AppGallery Connect**](#1-create-an-app-on-appgallery-connect)
    - [1. **Configure APIs and Permissions**](#1-configure-apis-and-permissions)
    - [1. **Download the JSON Configuration File**](#1-download-the-json-configuration-file)
  - [Developing the Application](#developing-the-application)
    - [1. **Project Creation in DevEco Studio**](#1-project-creation-in-deveco-studio)
    - [2. **Fetching User Location**](#2-fetching-user-location)
      - [Step 1: Set Required Permissions](#step-1-set-required-permissions)
      - [Step 2: Implement the Location Fetching Logic](#step-2-implement-the-location-fetching-logic)
      - [Step 3: Design the UI](#step-3-design-the-ui)
  - [Running the App](#running-the-app)
    - [Running on Simulator](#running-on-simulator)
    - [Running on a Physical Device](#running-on-a-physical-device)
  - [Additional Resources](#additional-resources)
  - [Conclusion](#conclusion)

---

## Requirements

Before starting development, ensure your system meets the following requirements:

- [ ] **Huawei Developer account**: Huawei Developer account is required to access all Huawei services, and is required to run HarmonyOS app on a HarmonyOS device: [Register a Developer Acount](https://developer.huawei.com/consumer/en/doc/start/registration-and-verification-0000001053628148)

- [ ] **DevEco Studio** : DevEco Studio is the official IDE for HarmonyOS development. Download and install the latest version of DevEco Studio using the following link: [Download DevEco Studio](https://developer.huawei.com/consumer/cn/deveco-studio/archive/)

- [ ] **HarmonyOS SDK**: The HarmonyOS SDK provides essential tools, libraries, and APIs for development. You can download SDK from within DevEco studio by going to **Tools** > **SDK Manager**, it is recommended to download SDK 3.0.0 (API 8) or newer You can install the SDK from within DevEco Studio after setting it up: [Install HarmonyOS SDK](https://developer.harmonyos.com/en/docs/documentation/doc-guides/ide-toolkit-0000001070643051)

- [ ] **Node.js**: Node.js is required for JavaScript-based HarmonyOS development. Download and install Node.js from the official website: [Download Node.js](https://nodejs.org/en/download/)

### 4. **Other Tools**

- [ ] **JDK 1.8 or later**: Ensure you have the Java Development Kit installed.
- [ ] **Git**: Version control tool for managing your codebase.

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

## Developing the Application

### 1. **Project Creation in DevEco Studio**

Follow these steps to create a project in DevEco Studio:

1. Open **DevEco Studio**.
2. Click on **"New Project"** and choose **HarmonyOS Wearable** as the template.
3. Enter the project details such as **Package Name**, **App Name**, and **Minimum API Level**.

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

<style>
.container {
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

## Running the App

### Running on Simulator

1. In **DevEco Studio**, go to **Device Manager**.
2. Select **Wearable Emulator** and create a new wearable simulator.
3. Build and run the project on the simulator.
4. Use the simulator tools to test features such as **Location Services**.

### Running on a Physical Device

1. **Enable Developer Options** on your HarmonyOS LiteWearable device:
   - Go to **Settings** > **About Device** and tap **Build Number** multiple times to enable Developer Mode.
2. Enable **ADB Debugging** on the device.
3. Connect the device to your computer via USB or Wi-Fi.
4. In **DevEco Studio**, select the physical device from the **Device Manager**.
5. Build and run the app on the physical device to test on real hardware.

---

## Additional Resources

- [HarmonyOS Documentation](https://developer.harmonyos.com/en/docs/documentation)
- [Huawei LiteWearable API Reference](https://developer.harmonyos.com/en/docs/documentation/doc-guides/wearable-overview-0000001054916109)
- [AppGallery Connect Documentation](https://developer.huawei.com/consumer/en/doc/development/AppGallery-connect-Guides/agc-get-started-0000001053628149)

---

## Conclusion

You are now set up to start developing applications for Huawei LiteWearable devices using HarmonyOS. This guide covered the basic setup, app creation, running on simulators and physical devices, and a simple example to fetch the user's location. For more advanced use cases, refer to the official documentation and API references.

Happy coding!
