import 'package:dactest/ui/screens/home.dart';
import 'package:dactest/ui/screens/splash.dart';
import 'package:dactest/ui/screens/unknown.dart';
import 'package:flutter/material.dart';

///
/// Class AppRouter is designed to handling routes in whole app.
/// Using native and pre-built functions
///
class AppRouter {
  /// Handle routes app
  static Route onGenerateRoute(RouteSettings routeSettings) {
    
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => const UnknownScreen());
    }
  }

}