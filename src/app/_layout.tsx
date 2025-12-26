import { SafeAreaProvider } from 'react-native-safe-area-context';
import AppRootNavigation from './rootNavigation';


export default function RootLayout() {
  return (
    <SafeAreaProvider>
      <AppRootNavigation />
    </SafeAreaProvider>
  );
}
