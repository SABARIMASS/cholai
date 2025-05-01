import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'themex_colors.dart';

final ThemeData themeData = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  primaryColor: Themex.theme.value.kPrimaryColor,
  scaffoldBackgroundColor: Themex.theme.value.kAppBackgroundColor,
  fontFamily: GoogleFonts.montserrat().fontFamily,
  textTheme: GoogleFonts.montserratTextTheme().apply(
    bodyColor: Colors.black,
    displayColor: Colors.black,
  ),
  primaryTextTheme: GoogleFonts.montserratTextTheme().apply(
    bodyColor: Colors.black,
    displayColor: Colors.black,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.black54,
    selectionColor: Color(0xCC000000), // ~ alpha 0.8
    selectionHandleColor: Color(0xB3000000), // ~ alpha 0.7
  ),
);

final ThemeData themeDataDark = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  primaryColor: Themex.theme.value.kPrimaryColor,
  scaffoldBackgroundColor: Themex.theme.value.kAppBackgroundColor,
  fontFamily: GoogleFonts.montserrat().fontFamily,
  textTheme: GoogleFonts.montserratTextTheme().apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  ),
  primaryTextTheme: GoogleFonts.montserratTextTheme().apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.white,
    selectionColor: Color(0xCCFFFFFF),
    selectionHandleColor: Color(0xB3FFFFFF),
  ),
);

extension CustomTheme on ThemeData {
  CustomThemeData get appTheme => Themex.theme.value;
  Color get baseColor =>
      Theme.of(Get.context!).brightness == Brightness.dark
          ? const Color.fromARGB(255, 68, 68, 68)
          : Colors.grey[300]!;
  Color get highlightColor =>
      Theme.of(Get.context!).brightness == Brightness.dark
          ? const Color.fromARGB(255, 84, 84, 84)
          : Colors.grey[100]!;
  String get myFontFamily => GoogleFonts.montserrat().fontFamily!;
}
