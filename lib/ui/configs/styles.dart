import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///
/// AppText defines all fonts styles in the app
///
class AppTexts {
  static TextStyle headline1 = GoogleFonts.roboto(fontSize: 34);

  static TextStyle headline2 = GoogleFonts.roboto(fontSize: 30);
  
  static TextStyle headline3 = GoogleFonts.roboto(fontSize: 26);
  
  static TextStyle headline4 = GoogleFonts.roboto(fontSize: 22);
  
  static TextStyle headline5 = GoogleFonts.roboto(fontSize: 18);
  
  static TextStyle headline6 = GoogleFonts.roboto(fontSize: 14);
  
  static TextStyle headline7 = GoogleFonts.roboto(fontSize: 10);
}


///
///AppColors defines all colors used in the app.
///The primary colors are defined as constants
///
class AppColors {
  static const Color darkColor = Color(0xFF363C32);

  static const Color whiteColor = Color(0xFFFAFFF7);

  static const Color grayColor = Color(0xFFEFFEE7);

  static const Color redColor = Color.fromARGB(255, 255, 34, 34);

  static const Color greenColor = Color.fromARGB(255, 59, 196, 74);

  static const Color primaryColor = Color.fromARGB(255, 126, 24, 194);
}