import { AppHeader } from "@/src/components";
import { Stack } from "expo-router";

const AppRootNavigation = () => {
	return (
		<Stack>
			<Stack.Screen
				name="index"
				options={{
					headerBackButtonMenuEnabled: false,
					headerShown: true,
					title: "Camera Native Features",
					header: (props) => <AppHeader {...props} />,
				}}
			/>
		</Stack>
	);
};

export default AppRootNavigation;
