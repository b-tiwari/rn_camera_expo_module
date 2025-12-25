import { Stack } from "expo-router";
import { StatusBar } from "expo-status-bar";

const AppRootNavigation = () => {
	return (

		<>
			<StatusBar style="light" backgroundColor="#af9cd6" translucent={false} />
			<Stack>
				<Stack.Screen
					name="index"
					options={{
						headerBackButtonMenuEnabled: false,
						headerShown: true,
						title: "Camera Native Features",
						headerStyle: {
							backgroundColor: "#af9cd6",
						},
						headerTintColor: "#fff",
						contentStyle: { backgroundColor: '#f0f0f0' },
						headerTitleStyle: { fontWeight: "bold", color: '#370386' },
					}}
				/>
			</Stack>
		</>

	);
};

export default AppRootNavigation;
