import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          fontSize: 17.sp,
          fontFamily: "Euclid",
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          fontSize: 13.sp,
          fontFamily: "Euclid",
          fontWeight: FontWeight.w400,
        ),
        displaySmall: TextStyle(
          fontSize: 34.sp,
          fontFamily: "Euclid",
          fontWeight: FontWeight.w800,
        ),
        labelLarge: TextStyle(
          fontSize: 13.sp,
          fontFamily: "SF Pro",
          fontWeight: FontWeight.w700,
        ),
        labelMedium: TextStyle(
          fontSize: 10.sp,
          fontFamily: "Euclid",
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          color: colorScheme.primary,
          fontSize: 17.sp,
          fontFamily: "Euclid",
          fontWeight: FontWeight.w900,
        ),
        titleSmall: TextStyle(
          fontSize: 15.sp,
          fontFamily: "Euclid",
          fontWeight: FontWeight.w600,
        ),
      );
}
