import 'package:flutter/material.dart';
import 'package:take_home/theme/app_colors.dart';

AppColors get appTheme => ThemeHelper().themeColor();

class ThemeHelper {
  static ThemeData light =
      ThemeData(useMaterial3: false, fontFamily: "Euclid").copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.white,
    brightness: Brightness.light,
  );

  /// Returns the primary colors for the current theme.
  AppColors themeColor() => AppColors();
}


