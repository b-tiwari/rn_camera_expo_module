import { registerWebModule, NativeModule } from 'expo';

import { ChangeEventPayload } from './AppNativeCamera.types';

type AppNativeCameraModuleEvents = {
  onChange: (params: ChangeEventPayload) => void;
}

class AppNativeCameraModule extends NativeModule<AppNativeCameraModuleEvents> {
  PI = Math.PI;
  async setValueAsync(value: string): Promise<void> {
    this.emit('onChange', { value });
  }
  hello() {
    return 'Hello world! 👋';
  }
};

export default registerWebModule(AppNativeCameraModule, 'AppNativeCameraModule');
