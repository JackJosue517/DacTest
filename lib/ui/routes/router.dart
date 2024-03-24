import 'package:dactest/ui/screens/add_new_user.dart';
import 'package:dactest/ui/screens/home.dart';
import 'package:dactest/ui/screens/search.dart';
import 'package:dactest/ui/screens/settings.dart';
import 'package:dactest/ui/screens/splash.dart';
import 'package:dactest/ui/screens/unknown.dart';
import 'package:dactest/ui/screens/user_details.dart';
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
      case '/home/searchview':
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case '/home/add-user':
        return MaterialPageRoute(
          settings: routeSettings,
            builder: (_) => const AddNewUserScreen(),
        );
      case '/home/user-details':
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const UserDetailsScreen()
        );
      case '/home/settings':
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      default:
        return MaterialPageRoute(builder: (_) => const UnknownScreen());
    }
  }

}