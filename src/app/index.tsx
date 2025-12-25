import { Text, View } from "react-native";
import { AppNativeCameraView } from "../../modules/app-native-camera";

export default function Index() {
  return (
    <View
      style={{
        display: 'flex',
        width: '100%',
        flex: 1,
      }}
    >
      <View style={{ flex: 1, width: '100%',  alignItems: 'center', justifyContent: 'center'}}>
        <Text>Edit app/index.tsx to edit this screen.</Text>
      </View>
      <AppNativeCameraView 
        style={{ flex: 10,  width: '100%', alignItems: 'center' }} 
        btnText="Submit"
      />
    </View>
  );
}


