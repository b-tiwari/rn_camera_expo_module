import { requireNativeView } from "expo";
import type * as React from "react";

import { View } from "react-native";
import type { AppNativeCameraViewProps } from "./AppNativeCamera.types";

const NativeView: React.ComponentType<AppNativeCameraViewProps> =
	requireNativeView("AppNativeCamera");

export default function AppNativeCameraView(props: AppNativeCameraViewProps) {
  const { style, ...otherProps } = props;

	return (
    <View style={style}>
      {/* <Text>Rendering Native view</Text> */}
      <NativeView {...props} />
    </View>
  );

};
