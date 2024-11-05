# Object Detection by Adil Aabideen

A real-time camera-based object recognition app for iOS using Core ML and Vision. This project leverages machine learning to detect objects in a live camera feed and displays the identified object along with its confidence score.

## Table of Contents

- [Project Overview](#project-overview)
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [Troubleshooting](#troubleshooting)
- [Code Structure](#code-structure)

## Project Overview

**SmartCameraLBTA** is an iOS application that uses Core ML to recognize objects in real-time through the device's camera. This project was created to demonstrate Core ML integration with Vision and UIKit for live object detection.

## Features

- Real-time object recognition using Core ML
- Displays detected object's name and confidence level
- Dynamic UI with confidence bar indicator
- Supports various iOS devices (iPhone, iPad)

## Requirements

- **iOS**: 13.0+
- **Xcode**: 13.0+
- **Swift**: 5.0+

## Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/SmartCameraLBTA.git
   cd ObjectDetectionAdilAabideen
   ```
2.	Open the Project in Xcode:
•	Open SmartCameraLBTA.xcodeproj or SmartCameraLBTA.xcworkspace in Xcode.
3.	Install Dependencies (if any):
•	If the project uses CocoaPods or Swift Package Manager, ensure you have installed dependencies:
```bash
pod install  # Only if using CocoaPods
```
or through File > Swift Packages > Resolve Package Versions in Xcode if using Swift Package Manager.

## Configuration

1.	Set Up App Permissions:
•	Open Info.plist and add the following key to request camera access:
```bash
<key>NSCameraUsageDescription</key>
<string>We need camera access for object recognition</string>
```
2.	Add App Icon (optional):
•	Add app icon images to the Assets.xcassets folder to customize the app’s icon.
3.	Configure Signing & Capabilities:
•	In Xcode, go to the Signing & Capabilities tab in your target settings.
•	Ensure that your Apple ID is selected under Team for automatic signing.

## Usage

1.	Build and Run:
•	Connect a real iOS device (required for camera functionality).
•	Select your device in Xcode, then click the Run button or press Cmd + R to build and launch the app on the device.
2.	Using the App:
•	Once the app launches, allow camera permissions.
•	Point your device at various objects to see the app recognize them in real-time.
•	The detected object’s name and confidence percentage will be displayed at the bottom of the screen with a dynamic confidence bar.

## Troubleshooting

•	App Crashes on Launch:
•	Ensure that camera permissions are set correctly in Info.plist.
•	Test on a real device, as the camera does not work in the simulator.
•	No Object Detection Output:
•	Verify that the Core ML model (Resnet50.mlmodel) is added correctly to the project.
•	Check the console for error messages during runtime.
•	Cannot Build due to Signing Issues:
•	Ensure your Apple ID is added in Xcode’s Preferences under Accounts.
•	Under the Signing & Capabilities tab, select your Team and enable Automatically manage signing.

## Code Structure

•	ViewController.swift: Handles camera setup, frame processing, and object recognition logic.
•	AppDelegate.swift: Standard iOS app delegate for handling app life cycle events.
