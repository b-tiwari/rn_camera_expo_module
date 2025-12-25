import type { StyleProp, ViewStyle } from 'react-native';

export type OnLoadEventPayload = {
  url: string;
};

export type AppNativeCameraModuleEvents = {
  onChange: (params: ChangeEventPayload) => void;
};

export type ChangeEventPayload = {
  value: string;
};

export type AppNativeCameraViewProps = {
  // url: string;
  // onLoad: (event: { nativeEvent: OnLoadEventPayload }) => void;
  btnText?: string;
  // onSubmit(event: SubmitEvent)?: void;
  style?: StyleProp<ViewStyle>;
};
