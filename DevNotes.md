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
