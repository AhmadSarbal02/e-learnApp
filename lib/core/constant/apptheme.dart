import 'package:flutter/material.dart';
import 'package:project/core/constant/color.dart';

ThemeData themeEnglish = ThemeData(
  textTheme: const TextTheme(
    // ignore: deprecated_member_use
    headlineLarge: TextStyle(
      color: Colors.black,
      fontSize: 28,
    ),
    // ignore: deprecated_member_use
    bodyLarge: TextStyle(
      height: 2, color: AppColor.grey, //fontWeight: FontWeight.bold
    ),
  ),
);

ThemeData themeArabic = ThemeData(
  // fontFamily: "Cairo",
  textTheme: const TextTheme(
    // ignore: deprecated_member_use
    headlineLarge: TextStyle(
      color: Colors.black,
      fontSize: 28,
    ),
    // ignore: deprecated_member_use
    bodyLarge: TextStyle(
      height: 2, color: AppColor.grey, //fontWeight: FontWeight.bold
    ),
  ),
);
