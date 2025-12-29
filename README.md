# React Native Camera Expo Module

A React Native hobby project featuring a custom **native camera module**. 

It implements a simple camera view using Expo's **(Native) Module API** that provides the camera functionality with native iOS (Swift) and Android (Kotlin/Java) implementations, wrapped in a React Native component.


## Features

- **Custom Native Camera Module**: Built using Expo Module API
- **Cross-platform Support**: iOS and Android native implementations
- **Camera Permissions**: Automatic handling of camera and microphone permissions
- **Modern React Native**: Uses React Native 0.81.5 with Expo SDK 54
- **TypeScript Support**: Fully typed codebase
- **EAS Build Ready**: Configured for Expo Application Services (EAS) builds
- **New Architecture Support**: Compatible with React Native's new architecture


## Screenshots and videos
(To-do)
+ [ ] Add screenshot of App's Camera view on iPhone
+ [ ] Add screenshot of App's Camera view on Android


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
```



## Custom Native Module

The `app-native-camera` module demonstrates:

- **Expo Module Configuration**: Platform-specific module setup
- **Native View Components**: Custom camera UI components
- **TypeScript Integration**: Type-safe props and events
- **Cross-platform Implementation**: Separate iOS (Swift) and Android implementations

### Module Structure
- `AppNativeCameraModule.ts`: Main module interface
- `AppNativeCameraView.tsx`: React component wrapper
- `AppNativeCamera.types.ts`: TypeScript definitions
- `ios/`: Swift implementation for iOS
- `android/`: Kotlin/Java implementation for Android



## Development

### Code Formatting
The project uses ESLint for code linting:
```bash
npm run lint
```

### Prebuild
To regenerate native code:
```bash
npm run prebuild
```

## Security

- API keys and secrets are managed through EAS secrets
- `app.json` contains the EAS project ID
- Service account keys for Play Store deployment are stored securely

## Build & Deployment

### Android
```bash
# Create production build
eas build --platform android --profile production

# Submit to Play Store
eas submit --platform android --profile production
```

### iOS
```bash
# Create production build
eas build --platform ios --profile production

# Submit to App Store
eas submit --platform ios --profile production
```

---

**Note**: This is a hobby project demonstrating the creation of custom native modules with Expo. For production camera functionality, consider using established libraries like `expo-camera` or `react-native-vision-camera`.
