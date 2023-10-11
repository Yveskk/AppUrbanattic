import 'package:flutter/material.dart';

import '../../constants/global_style.dart';

final inputBorder = OutlineInputBorder(
  borderSide: const BorderSide(width: 0.4),
  borderRadius: BorderRadius.circular(radius),
);

final themeLight = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.light,
  ),
  useMaterial3: true,
  fontFamily: 'CircularStd',
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: primaryColor.withOpacity(0.01),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 8.0,
    ),
    border: inputBorder,
    enabledBorder: inputBorder,
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
      ),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.grey[600],
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
    color: Colors.white,
    elevation: 0,
  )
);
