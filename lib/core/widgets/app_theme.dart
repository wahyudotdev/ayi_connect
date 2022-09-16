import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  final textTheme = TextTheme(
    headline1: GoogleFonts.notoSans(
        fontSize: 89, fontWeight: FontWeight.w300, letterSpacing: -1.5),
    headline2: GoogleFonts.notoSans(
        fontSize: 36, fontWeight: FontWeight.w300, letterSpacing: -0.5),
    headline3: GoogleFonts.notoSans(fontSize: 44, fontWeight: FontWeight.w400),
    headline4: GoogleFonts.notoSans(
      fontSize: 28,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: Colors.black,
    ),
    headline5: GoogleFonts.notoSans(fontSize: 24, fontWeight: FontWeight.w400),
    headline6: GoogleFonts.notoSans(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
    ),
    subtitle1: GoogleFonts.notoSans(
        fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.15),
    subtitle2: GoogleFonts.notoSans(
        fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.1),
    bodyText1: GoogleFonts.notoSans(
      color: AppColors.textBlack,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.1,
    ),
    bodyText2: GoogleFonts.notoSans(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
    ),
    button: GoogleFonts.notoSans(
      fontSize: 14,
      letterSpacing: 0.15,
      color: Colors.white,
    ),
    caption: GoogleFonts.notoSans(
        fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.4),
    overline: GoogleFonts.notoSans(
        fontSize: 11, fontWeight: FontWeight.w400, letterSpacing: 1.5),
  );

  final appBarTheme = const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: AppColors.textBlack,
    centerTitle: true,
    elevation: 0,
  );

  final checkBoxTheme = CheckboxThemeData(
    fillColor: MaterialStateProperty.all(AppColors.primary),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.r),
    ),
    overlayColor: MaterialStateProperty.all(AppColors.softGray),
  );

  final radioTheme = RadioThemeData(
    fillColor: MaterialStateProperty.all(AppColors.primary),
  );

  final inputDecorationTheme = InputDecorationTheme(
    iconColor: AppColors.primarySwatch,
    focusColor: AppColors.primarySwatch,
  );

  static final marginHorizontal = 24.w;
  static final marginVertical = 24.h;
}
