import 'package:flutter/services.dart';

//primary swatch
const Map<int, Color> primaryColor = {
  50: Color.fromRGBO(40, 5, 89, 0.1),
  100: Color.fromRGBO(40, 5, 89, 0.2),
  200: Color.fromRGBO(40, 5, 89, 0.3),
  300: Color.fromRGBO(40, 5, 89, 0.4),
  400: Color.fromRGBO(40, 5, 89, 0.5),
  500: Color.fromRGBO(40, 5, 89, 0.6),
  600: Color.fromRGBO(40, 5, 89, 0.7),
  700: Color.fromRGBO(40, 5, 89, 0.8),
  800: Color.fromRGBO(40, 5, 89, 0.9),
  900: Color.fromRGBO(40, 5, 89, 1),
};

// blue
const yellowPrimary = Color.fromRGBO(255, 149, 0, 1);
const purplePrimary = Color.fromRGBO(28, 0, 128, 1);

const redPrimary = Color.fromRGBO(255, 59, 48, 1);
const redSecondary = Color.fromRGBO(255, 66, 41, 1);

const blackPrimary = Color.fromRGBO(48, 44, 43, 1);
const blackSecondary = Color.fromRGBO(35, 35, 35, 1);
const blackLight = Color.fromRGBO(18, 18, 18, 1);

const skylarColor = Color.fromRGBO(107, 206, 188, 1);
const backgroundColor = Color.fromRGBO(248, 248, 248, 1);
const dividerColor = Color.fromRGBO(230, 237, 255, 1);
const greenPrimary = Color.fromRGBO(52, 199, 89, 1);
const darkPurple = Color.fromARGB(255, 97, 27, 130);
const litePurple = Color(0xffd3a4e9);
const babyPink = Color(0xfffea4c9);

const greenBush = Color.fromRGBO(52, 94, 86, 1);
const bluePrimary = Color.fromRGBO(40, 5, 89, 1);
const androidLineColor = Color.fromRGBO(52, 122, 226, 1);
const iosLineColor = Color.fromRGBO(255, 149, 0, 1);
const menLineColor = Color.fromRGBO(52, 122, 226, 1);
const womenLineColor = Color.fromRGBO(253, 74, 149, 1);
const allUserLineColor = Color.fromRGBO(86, 186, 108, 1);
const blueSecondary = Color.fromRGBO(142, 205, 240, 1);
const textColor = Color.fromRGBO(124, 140, 181, 1);
const borderColor = Color.fromRGBO(230, 237, 255, 1);
const containerBorderColor = Color.fromRGBO(203, 210, 220, 0.5);
const containerTextColor = Color.fromRGBO(83, 83, 83, 0.50);
const containerShadowColor = Color.fromRGBO(190, 191, 195, 0.1);
const imagePickerColor = Color.fromRGBO(230, 239, 243, 1);
const greenSecondary = Color.fromRGBO(40, 5, 89, 0.26);
const greenLight = Color.fromRGBO(40, 5, 89, 0.07);
const pinkPrimary = Color.fromRGBO(253, 74, 149, 1);

const greyPrimary = Color.fromRGBO(130, 130, 130, 1);
const textGreyColor = Color.fromRGBO(146, 146, 157, 1);
const greySecondary = Color.fromRGBO(219, 219, 219, 1);
const greyButtonColor = Color.fromRGBO(248, 249, 251, 1);
const greyLight = Color.fromRGBO(198, 198, 198, 1);
const greyDark = Color.fromRGBO(139, 139, 139, 1);

const whitePrimary = Color.fromRGBO(255, 255, 255, 1);
const radialPrimary = Color.fromRGBO(230, 237, 255, 1);
const whiteSecondary = Color.fromRGBO(245, 245, 245, 1);
const whiteShedow = Color.fromRGBO(238, 238, 238, 1);

// statusBar

greenStatusBar() {
  return const SystemUiOverlayStyle(
      statusBarColor: bluePrimary,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: whitePrimary,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: greenSecondary);
}

whiteStatusBar() {
  return const SystemUiOverlayStyle(
      statusBarColor: whitePrimary,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: whitePrimary,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: whitePrimary);
}
