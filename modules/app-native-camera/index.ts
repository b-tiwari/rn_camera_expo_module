// Reexport the native module. On web, it will be resolved to AppNativeCameraModule.web.ts
// and on native platforms to AppNativeCameraModule.ts
export { default } from './src/AppNativeCameraModule';
export { default as AppNativeCameraView } from './src/AppNativeCameraView';
export * from  './src/AppNativeCamera.types';
