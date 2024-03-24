import 'package:dactest/core/blocs/app/app_bloc.dart';
import 'package:dactest/ui/components/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const GoBackButton(),
        title: const Text('Paramètres'),
      ),
      body: Column(
        children: <Widget>[
          // SwitchListTile.adaptive(
          //   title: const Text('Thème sombre'),
          //   subtitle: const Text('Activer le mode sombre'),
          //   value: context.read<AppBloc>().state.isDark,
          //   onChanged: _onThemeChanged
          // ),
        ],
      ),
    );
  }

  /// Callback function to theme changed
  void _onThemeChanged(bool value) {
    context.read<AppBloc>().add(ThemeChanged(value));
  }
}