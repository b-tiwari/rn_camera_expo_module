import * as React from 'react';

import { AppNativeCameraViewProps } from './AppNativeCamera.types';

export default function AppNativeCameraView(props: AppNativeCameraViewProps) {
  return (
    <div>
      <iframe
        style={{ flex: 1 }}
        src={props.url}
        onLoad={() => props.onLoad({ nativeEvent: { url: props.url } })}
      />
    </div>
  );
}
