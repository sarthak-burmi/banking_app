import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:banking_app/widgets/Colors/colors.dart';

class AppTextStyles {
  static final TextTheme lightTextTheme =
      GoogleFonts.dmSerifDisplayTextTheme().copyWith(
    headlineLarge: TextStyle(color: black),
    headlineSmall: TextStyle(color: Colors.black),
    headlineMedium: TextStyle(color: Colors.black),
    //
    bodyLarge: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color: Colors.black),
    bodySmall: TextStyle(color: Colors.black),
    //
    displayLarge: TextStyle(color: Colors.black),
    displayMedium: TextStyle(color: Colors.black),
    displaySmall: TextStyle(color: Colors.black),
    //
    labelLarge: TextStyle(color: Colors.black),
    labelMedium: TextStyle(color: Colors.black),
    labelSmall: TextStyle(color: Colors.black),
    //
  );

  static final TextTheme darkTextTheme =
      GoogleFonts.dmSerifDisplayTextTheme().copyWith(
    headlineLarge: TextStyle(color: Colors.white),
    headlineMedium: TextStyle(color: Colors.white),
    headlineSmall: TextStyle(color: Colors.white),
    //
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white),
    bodySmall: TextStyle(color: Colors.white),
    //
    displayLarge: TextStyle(color: Colors.white),
    displayMedium: TextStyle(color: Colors.white),
    displaySmall: TextStyle(color: Colors.white),
    //
    labelLarge: TextStyle(color: white),
    labelMedium: TextStyle(color: white),
    labelSmall: TextStyle(color: white),
  );
}
