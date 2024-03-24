import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:dactest/ui/screens/home.dart';
import 'package:dactest/ui/configs/styles.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: const LineIcon.airbnb(size: 150, color: AppColors.primaryColor,),
      nextScreen: const HomeScreen(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}