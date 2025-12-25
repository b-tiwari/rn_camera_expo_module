import type { ViewStyle } from "react-native";
import { StyleSheet } from "react-native";

const flexDisplay: ViewStyle = {
	display: 'flex',
	flexDirection: 'row',
	alignItems: 'flex-end',
	justifyContent: 'flex-start',
};

const styles = () => {
	return StyleSheet.create({
		hdrContainer: {
			...flexDisplay,
			backgroundColor: '#777',
			borderWidth: 3,
			height: '30%',
            padding: 10,
			borderColor: '#efad05',
		},
        headerTitle: {
            color: '#EEE',
            fontSize: 20,
			borderColor: '#05adef',
			borderWidth: 3,
        },
	});
};

export default styles;
