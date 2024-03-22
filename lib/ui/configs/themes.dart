import 'package:dactest/ui/configs/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///
/// The class AppTheme is used to manage the theme
/// of the app. Very useful for dark themes
///
class AppTheme {

  /// Define the font style for app
  static ThemeData buildTheme(brightness) {
    var baseTheme = ThemeData(
      brightness: brightness, 
      useMaterial3: true, 
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor,),
      appBarTheme: _buildAppBarTheme(),
      scaffoldBackgroundColor: Colors.white,
    );
    
    return baseTheme.copyWith(
      textTheme: GoogleFonts.latoTextTheme(baseTheme.textTheme),
    );
  }

  /// Manage AppBarThemeData
  static AppBarTheme _buildAppBarTheme() {
    return AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.whiteColor,
      color: AppColors.primaryColor,
    );
  }
  
}