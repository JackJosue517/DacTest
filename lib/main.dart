import 'package:dactest/ui/configs/themes.dart';
import 'package:dactest/ui/routes/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DacTest',
      theme: AppTheme.buildTheme(Brightness.dark),
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
