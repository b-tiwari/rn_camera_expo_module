import type { NativeStackHeaderProps } from "@react-navigation/native-stack";
import type { JSX } from "react";
import { Text, View } from "react-native";
import styles from "./styles";

type React$Node = JSX.Element | null;
// type compProps = {
//     children: string,
//     tintColor?: string | undefined
// }

const AppHeader: (props: NativeStackHeaderProps) => React$Node = (props) => {
	const compStyles = styles();

    const { back, navigation, route, options } = props;

	return (
        <View style={compStyles.hdrContainer}>
            <Text style={compStyles.headerTitle}>{options.title || ""}</Text>
        </View>
	);
};

export default AppHeader;
