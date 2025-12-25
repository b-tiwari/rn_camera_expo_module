import { NativeModule, requireNativeModule } from 'expo';

import { AppNativeCameraModuleEvents } from './AppNativeCamera.types';

declare class AppNativeCameraModule extends NativeModule<AppNativeCameraModuleEvents> {
  PI: number;
  hello(): string;
  setValueAsync(value: string): Promise<void>;
}

// This call loads the native module object from the JSI.
export default requireNativeModule<AppNativeCameraModule>('AppNativeCamera');
