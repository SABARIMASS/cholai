// import 'package:flutter/material.dart';

// class CustomThemeData {
//   final Color kAppColor;
//   Color kPrimaryColor;
//   final Color kWhite;
//   final Color kPrimaryColorShadow;
//   final Color kPrimaryTextColor;
//   final Color kSecondaryTextColor;
//   final Color kHintTextColor;
//   final Color kTextFieldPrimaryBackgroundColor;
//   final Color kTextFieldSecondaryBackgroundColor;
//   final Color kAppBackgroundColor;
//   final Color kSwitchThumbColorColor;
//   final Color kAppBackgroundColorSecondary;
//   final Color kStatusBarPrimaryColor;
//   final Color kIconPrimaryColor;
//   final Color kInActiveColor;
//   final Color kPrimaryLoader;
//   final Color kAppbarPrimaryColor;
//   final Color kTabBarPrimaryColor;
//   final Color kIconSecondaryColor;
//   final Color kLightColor;
//   final Color kIconLightColor;
//   final Color kButtonPrimaryColor;
//   final Color kLoaderPrimaryColor;
//   final Color kOnline;
//   final Color kBlack;
//   final Color kCursorColor;
//   final Color kRed;
//   final Color kGreen;
//   final Color kCheckColor;
//   final Color kPrimaryBorderColor;
//   final Color kLightBorderColor;
//   final Color kOnInfoColor;
//   final Color kOnWarningColor;
//   final Color kOnSuccessColor;
//   final Color kOnErrorColor;
//   final Color kDisableColor;

//   CustomThemeData({
//     this.kAppColor = Colors.green,
//     this.kPrimaryColor = Colors.black,
//     this.kWhite = Colors.white,
//     this.kPrimaryColorShadow = Colors.blueGrey,
//     this.kPrimaryTextColor = Colors.black,
//     this.kSecondaryTextColor = Colors.white,
//     this.kHintTextColor = Colors.black38,
//     this.kTextFieldPrimaryBackgroundColor = const Color(0xFFF5F5F5),
//     this.kTextFieldSecondaryBackgroundColor = const Color(0xFFE0E0E0),
//     this.kAppBackgroundColor = Colors.white,
//     this.kSwitchThumbColorColor = Colors.white,
//     this.kAppBackgroundColorSecondary = const Color(0xFFEEEEEE),
//     this.kStatusBarPrimaryColor = Colors.white,
//     this.kIconPrimaryColor = Colors.black,
//     this.kInActiveColor = Colors.grey,
//     this.kPrimaryLoader = Colors.white,
//     this.kAppbarPrimaryColor = Colors.orange,
//     this.kTabBarPrimaryColor = const Color(0xFFF5F5F5),
//     this.kIconSecondaryColor = Colors.white,
//     this.kLightColor = Colors.blueGrey,
//     this.kIconLightColor = Colors.blueGrey,
//     this.kButtonPrimaryColor = const Color.fromARGB(255, 4, 4, 4),
//     this.kLoaderPrimaryColor = Colors.black,
//     this.kOnline = Colors.green,
//     this.kBlack = Colors.black,
//     this.kCursorColor = const Color.fromARGB(255, 0, 0, 0),
//     this.kRed = Colors.red,
//     this.kGreen = Colors.green,
//     this.kCheckColor = Colors.white,
//     this.kPrimaryBorderColor = Colors.blueGrey,
//     this.kLightBorderColor = const Color(0xFFE0E0E0),
//     this.kOnInfoColor = Colors.blue,
//     this.kOnWarningColor = Colors.red,
//     this.kOnSuccessColor = Colors.green,
//     this.kOnErrorColor = Colors.red,
//     this.kDisableColor = Colors.grey,
//   });

//   factory CustomThemeData.fromJson(Map<String, dynamic> json) {
//     Color parseColor(String? hexColor, {Color defaultColor = Colors.grey}) {
//       if (hexColor == null || hexColor.length != 6) return defaultColor;
//       return int.tryParse(hexColor, radix: 16) != null
//           ? Color(int.parse('0xFF$hexColor'))
//           : defaultColor;
//     }

//     return CustomThemeData(
//       kAppColor: parseColor(json['kAppColor'], defaultColor: Color(0xFF0B5507)),
//       kPrimaryColor: parseColor(
//         json['kPrimaryColor'],
//         defaultColor: Color.fromARGB(255, 0, 0, 0),
//       ),
//       kWhite: parseColor(json['kWhite'], defaultColor: Colors.white),
//       kPrimaryColorShadow: parseColor(
//         json['kPrimaryColorShadow'],
//         defaultColor: Colors.blueGrey,
//       ),
//       kPrimaryTextColor: parseColor(
//         json['kPrimaryTextColor'],
//         defaultColor: Colors.black,
//       ),
//       kSecondaryTextColor: parseColor(
//         json['kSecondaryTextColor'],
//         defaultColor: const Color.fromARGB(255, 255, 255, 255),
//       ),
//       kHintTextColor: parseColor(
//         json['kHintTextColor'],
//         defaultColor: Colors.black38,
//       ),
//       kTextFieldPrimaryBackgroundColor: parseColor(
//         json['kTextFieldPrimaryBackgroundColor'],
//         defaultColor: const Color(0xFFF5F5F5),
//       ),
//       kTextFieldSecondaryBackgroundColor: parseColor(
//         json['kTextFieldSecondaryBackgroundColor'],
//         defaultColor: const Color(0xFFE0E0E0),
//       ),
//       kAppBackgroundColor: parseColor(
//         json['kAppBackgroundColor'],
//         defaultColor: Colors.white,
//       ),
//       kSwitchThumbColorColor: parseColor(
//         json['kSwitchThumbColorColor'],
//         defaultColor: Colors.white,
//       ),
//       kAppBackgroundColorSecondary: parseColor(
//         json['kAppBackgroundColorSecondary'],
//         defaultColor: const Color(0xFFEEEEEE),
//       ),
//       kStatusBarPrimaryColor: parseColor(
//         json['kStatusBarPrimaryColor'],
//         defaultColor: Colors.white,
//       ),
//       kIconPrimaryColor: parseColor(
//         json['kIconPrimaryColor'],
//         defaultColor: Colors.black,
//       ),
//       kInActiveColor: parseColor(
//         json['kInActiveColor'],
//         defaultColor: Colors.grey,
//       ),
//       kPrimaryLoader: parseColor(
//         json['kPrimaryLoader'],
//         defaultColor: Colors.white,
//       ),
//       kAppbarPrimaryColor: parseColor(
//         json['kAppbarPrimaryColor'],
//         defaultColor: Colors.black,
//       ),
//       kTabBarPrimaryColor: parseColor(
//         json['kTabBarPrimaryColor'],
//         defaultColor: const Color(0xFFF5F5F5),
//       ),
//       kIconSecondaryColor: parseColor(
//         json['kIconSecondaryColor'],
//         defaultColor: Colors.white,
//       ),
//       kLightColor: parseColor(
//         json['kLightColor'],
//         defaultColor: Colors.blueGrey,
//       ),
//       kIconLightColor: parseColor(
//         json['kIconLightColor'],
//         defaultColor: Colors.blueGrey,
//       ),
//       kButtonPrimaryColor: parseColor(
//         json['kButtonPrimaryColor'],
//         defaultColor: Color.fromARGB(255, 4, 4, 4),
//       ),
//       kLoaderPrimaryColor: parseColor(
//         json['kLoaderPrimaryColor'],
//         defaultColor: Color.fromARGB(255, 0, 0, 0),
//       ),
//       kOnline: parseColor(json['kOnline'], defaultColor: Colors.green),
//       kBlack: parseColor(json['kBlack'], defaultColor: Colors.black),
//       kCursorColor: parseColor(
//         json['kCursorColor'],
//         defaultColor: const Color.fromARGB(255, 0, 0, 0),
//       ),
//       kRed: parseColor(json['kRed'], defaultColor: Colors.red),
//       kGreen: parseColor(json['kGreen'], defaultColor: Colors.green),
//       kCheckColor: parseColor(json['kCheckColor'], defaultColor: Colors.white),
//       kPrimaryBorderColor: parseColor(
//         json['kPrimaryBorderColor'],
//         defaultColor: Colors.blueGrey,
//       ),
//       kLightBorderColor: parseColor(
//         json['kLightBorderColor'],
//         defaultColor: const Color(0xFFE0E0E0),
//       ),
//       kOnInfoColor: parseColor(json['kOnInfoColor'], defaultColor: Colors.blue),
//       kOnWarningColor: parseColor(
//         json['kOnWarningColor'],
//         defaultColor: Colors.red,
//       ),
//       kOnSuccessColor: parseColor(
//         json['kOnSuccessColor'],
//         defaultColor: Colors.green,
//       ),
//       kOnErrorColor: parseColor(
//         json['kOnErrorColor'],
//         defaultColor: Colors.red,
//       ),
//       kDisableColor: parseColor(
//         json['kDisableColor'],
//         defaultColor: Colors.grey,
//       ),
//     );
//   }
// }

// class GetThemeData {
//   final CustomThemeData lightTheme;
//   final CustomThemeData darkTheme;

//   GetThemeData({required this.lightTheme, required this.darkTheme});

//   factory GetThemeData.fromJson(Map<String, dynamic> jsons) {
//     //final jsonData = json.encode(sampleJson);
//     // Decoding JSON string back to Map
//     // Map<String, dynamic> decodedJson = json.decode(jsonData);

//     // Extracting lightTheme and darkTheme
//     Map<String, dynamic> lightTheme = Map<String, String>.from(
//       jsons['lightTheme'],
//     );
//     Map<String, dynamic> darkTheme = Map<String, String>.from(
//       jsons['darkTheme'],
//     );
//     return GetThemeData(
//       lightTheme: CustomThemeData.fromJson(lightTheme),
//       darkTheme: CustomThemeData.fromJson(darkTheme),
//     );
//   }
// }

// //   Map<String, dynamic> toJson() {
// //     return {
// //       'lightTheme': lightTheme.toJson(),
// //       'darkTheme': darkTheme.toJson(),
// //     };
// //   }
// // }

// // final sampleJson = {
// //   "lightTheme": {
// //     "kAppColor": "0B5507",
// //     "kPrimaryColor": "E0E105",
// //     "kWhite": "FFFFFF",
// //     "kPrimaryColorShadow": "C8EBFF",
// //     "kPrimaryTextColor": "000000",
// //     "kSecondaryTextColor": "F3F6F8",
// //     "kHintTextColor": "000000",
// //     "kTextFieldPrimaryBackgroundColor": "FAFAFA",
// //     "kTextFieldSecondaryBackgroundColor": "E7E7E7",
// //     "kAppBackgroundColor": "FFFFFF",
// //     "kSwitchThumbColorColor": "FFFFFF",
// //     "kAppBackgroundColorSecondary": "DEDEDE",
// //     "kStatusBarPrimaryColor": "FFFFFF",
// //     "kIconPrimaryColor": "000000",
// //     "kInActiveColor": "707475",
// //     "kPrimaryLoader": "FFFFFF",
// //     "kAppbarPrimaryColor": "F35C2A",
// //     "kTabBarPrimaryColor": "F4F0EE",
// //     "kIconSecondaryColor": "FFFFFF",
// //     "kLightColor": "C8CBCB",
// //     "kIconLightColor": "C8CBCB",
// //     "kButtonPrimaryColor": "F35C2A",
// //     "kLoaderPrimaryColor": "F35C2A",
// //     "kOnline": "18761B",
// //     "kBlack": "000000",
// //     "kCursorColor": "ECECEC",
// //     "kRed": "FF0000",
// //     "kGreen": "4F955D",
// //     "kCheckColor": "FFFFFF",
// //     "kprimaryBorderColor": "C8CBCB",
// //     "kLightBorderColor": "DCDCDC",
// //     "kOnInfoColor": "0000FF",
// //     "kOnWarningColor": "FF0000",
// //     "kOnSuccessColor": "000000",
// //     "kOnErrorColor": "FF0000",
// //     "kDisableColor": "808080"
// //   },
// //   "darkTheme": {
// //     "kAppColor": "0B5507",
// //     "kPrimaryColor": "E0E105",
// //     "kWhite": "FFFFFF",
// //     "kPrimaryColorShadow": "C8EBFF",
// //     "kPrimaryTextColor": "000000",
// //     "kSecondaryTextColor": "F3F6F8",
// //     "kHintTextColor": "000000",
// //     "kTextFieldPrimaryBackgroundColor": "FAFAFA",
// //     "kTextFieldSecondaryBackgroundColor": "E7E7E7",
// //     "kAppBackgroundColor": "FFFFFF",
// //     "kSwitchThumbColorColor": "FFFFFF",
// //     "kAppBackgroundColorSecondary": "DEDEDE",
// //     "kStatusBarPrimaryColor": "FFFFFF",
// //     "kIconPrimaryColor": "000000",
// //     "kInActiveColor": "707475",
// //     "kPrimaryLoader": "FFFFFF",
// //     "kAppbarPrimaryColor": "F35C2A",
// //     "kTabBarPrimaryColor": "F4F0EE",
// //     "kIconSecondaryColor": "FFFFFF",
// //     "kLightColor": "C8CBCB",
// //     "kIconLightColor": "C8CBCB",
// //     "kButtonPrimaryColor": "F35C2A",
// //     "kLoaderPrimaryColor": "F35C2A",
// //     "kOnline": "18761B",
// //     "kBlack": "000000",
// //     "kCursorColor": "ECECEC",
// //     "kRed": "FF0000",
// //     "kGreen": "4F955D",
// //     "kCheckColor": "FFFFFF",
// //     "kprimaryBorderColor": "C8CBCB",
// //     "kLightBorderColor": "DCDCDC",
// //     "kOnInfoColor": "0000FF",
// //     "kOnWarningColor": "FF0000",
// //     "kOnSuccessColor": "000000",
// //     "kOnErrorColor": "FF0000",
// //     "kDisableColor": "808080"
// //   }
// // };
