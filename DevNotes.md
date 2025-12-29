## Documentation of EAS
    `https://docs.expo.dev/eas/workflows/get-started`

## Install eas-cli 
    `npm install -g eas-cli`

## Or use EAS-CLI directly using npx
  `npx eas-cli@latest init` -> To initialize/enable project EAS console

#### Login using your EAS Account
  `npx eas-cli@latest login` 

#### See currently logged use
  `npx eas-cli@latest whoami` 

#### Configue Full Build process
  `npx eas-cli@latest build:configue` 

#### To Build
   `npx @eas-cli@latest build ` -> to build for iOS/Android or All
   `npx eas-cli@latest build --platform ios` -> for IOS

#### Expo Update

    If 'production' channel is spefiied in the `eas.json` file's production profile, 

then also install `expo updates` 

and run `eas update:configure` ( or `npx eas-cli@latest update:configue`)


### SECURITY

##### Files having API keys, secrects

```

    1. app.json  -> has EAS Project ID

```



## FOR ANDROID
#### First Create a build (EAS would create a AAB file for the app)
    `eas build --platform android --profile production`

#### Then Submit the build  to Android Play Store Console
    `eas submit --platform android --profile production`


## Project Structure

```
├── App.tsx                 # Entry point
├── app.json               # Expo configuration
├── src/
│   └── app/
│       ├── _layout.tsx    # Root layout with Expo Router
│       └── index.tsx      # Main screen with camera view
├── modules/
│   └── app-native-camera/ # Custom camera module
│       ├── expo-module.config.json
│       ├── index.ts
│       ├── android/       # Android native implementation
│       ├── ios/          # iOS native implementation (Swift)
│       └── src/
│           ├── AppNativeCameraModule.ts
│           ├── AppNativeCameraView.tsx
│           └── AppNativeCamera.types.ts
├── android/              # Android project files
├── ios/                  # iOS project files
└── app-example/          # Example app structure
```

## Installation

1. **Clone the repository**
   ```bash
   git clone [repository-url]
   cd rn_camera_expo_module
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Install iOS dependencies** (macOS only)
   ```bash
   cd ios && pod install && cd ..
   ```

## Running the Project

### Development Mode
```bash
# Start Expo development server
npm start

# Run on iOS simulator
npm run ios

# Run on Android emulator
npm run android

# Run on web
npm run web
```

### Production Builds

This project is configured with **Expo Application Services (EAS)** for production builds:

```bash
# Install EAS CLI
npm install -g @expo/eas-cli

# Login to EAS
eas login

# Configure EAS (if not already done)
eas build:configure

# Build for iOS
eas build --platform ios

# Build for Android
eas build --platform android

# Build for both platforms
eas build --platform all


## Permissions

The app requires the following permissions:

### iOS (`Info.plist`)
- `NSCameraUsageDescription`: "This app needs access to camera to capture photos and videos."
- `NSMicrophoneUsageDescription`: "This app needs access to microphone to record audio with videos."

### Android (`AndroidManifest.xml`)
- `android.permission.CAMERA`: Camera hardware access
- `android.permission.RECORD_AUDIO`: Audio recording for videos
