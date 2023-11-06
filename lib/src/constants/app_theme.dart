import 'package:drive_seller/src/constants/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData themeData() {
  return ThemeData(
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(AppColors.blueDark),
        fixedSize: MaterialStatePropertyAll(Size(311, 48)),
      ),
    ),
  );
}
