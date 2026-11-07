import 'package:flutter/material.dart';

const fontFamily = 'Poppins';

final themeLight = ThemeData(
  primaryColorLight: const Color(0xff2bb4c0),
  brightness: Brightness.light,
  primaryColor: const Color(0xff2bb4c0),
  highlightColor: Colors.black,
  canvasColor: Colors.white,
  fontFamily: fontFamily,
  splashColor: Colors.transparent,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.teal,
    brightness: Brightness.light,
  ).copyWith(
    primary: const Color(0xff2bb4c0),
    secondary: Colors.black,
    surface: Colors.white,
    onSurface: const Color(0xff141414),
    brightness: Brightness.light,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Color(0xff141414)),
    bodyMedium: TextStyle(color: Color(0xff141414)),
    bodySmall: TextStyle(color: Color(0xff484848)),
    titleMedium: TextStyle(color: Color(0xff141414)),
    titleSmall: TextStyle(color: Color(0xff484848)),
  ),
);

final themeDark = ThemeData(
  brightness: Brightness.dark,
  primaryColorDark: const Color(0xff2bb4c0),
  primaryColor: const Color(0xff2bb4c0),
  highlightColor: const Color(0xff2bb4c0),
  canvasColor: const Color(0xff121212),
  fontFamily: fontFamily,
  splashColor: Colors.transparent,
  scaffoldBackgroundColor: const Color(0xff0e0e0e),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.teal,
    brightness: Brightness.dark,
  ).copyWith(
    primary: const Color(0xff2bb4c0),
    secondary: const Color(0xff2bb4c0),
    surface: const Color(0xff1c1c1e),
    onSurface: Colors.white,
    brightness: Brightness.dark,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white),
    bodySmall: TextStyle(color: Colors.white70),
    titleMedium: TextStyle(color: Colors.white),
    titleSmall: TextStyle(color: Colors.white70),
  ),
);
