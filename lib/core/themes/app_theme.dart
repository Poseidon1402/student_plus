import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/app_colors.dart';

abstract class AppTheme {

  static final darkTextTheme = TextTheme(
      titleLarge: GoogleFonts.manrope(
        fontSize: 22,
        fontWeight: FontWeight.w800,
        color: AppColors.black1,
      ),
      titleMedium: GoogleFonts.manrope(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.black1,
      ),
      bodyLarge: GoogleFonts.manrope(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.black1,
      ),
      bodyMedium: GoogleFonts.manrope(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.black1,
      ),
      bodySmall: GoogleFonts.manrope(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: AppColors.black1,
      )
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      textTheme: darkTextTheme,
      useMaterial3: true,
    );
  }
}