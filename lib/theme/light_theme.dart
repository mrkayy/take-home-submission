import 'package:flutter/material.dart';
import 'package:take_home/theme/app_colors.dart';
import 'package:take_home/theme/text_helper.dart';

AppColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

class ThemeHelper {
  ThemeData _getThemeData() {
    var colorScheme = const ColorScheme.light(
      primary: Color(0XFFFC9E12),
    );
    return ThemeData(
      useMaterial3: true,
      fontFamily: "Euclid",
      colorScheme: colorScheme,
      visualDensity: VisualDensity.standard,
      textTheme: TextThemes.textTheme(colorScheme),
      primaryColor: appTheme.primary,
      scaffoldBackgroundColor: appTheme.white,
      brightness: Brightness.light,
    );
  }

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();

  /// Returns the primary colors for the current theme.
  AppColors themeColor() => AppColors();
}
