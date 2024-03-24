import 'package:dactest/core/blocs/app/app_bloc.dart';
import 'package:dactest/ui/components/back_button.dart';
import 'package:flutter/material.dart';
import 'package:dactest/ui/components/app_snackbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';

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
          SwitchListTile.adaptive(
            title: const Text('Thème sombre'),
             subtitle: const Text('Activer le mode sombre'),
             value: false,
              onChanged: _onThemeChanged,
          ),
          ListTile(
            title: const Text("Informations sur l'application"),
            leading: const Icon(LineIcons.infoCircle),
            trailing: const Icon(LineIcons.angleRight),
            onTap: _showAppLicenses,
          )
        ],
      ),
    );
  }

  /// Callback function to theme changed
  void _onThemeChanged(bool value) {
    //context.read<AppBloc>().add(ThemeChanged(value));
    ScaffoldMessenger.of(context).showSnackBar(AppSnackBar.infoSnackBar);
  }

  /// Show app licenses
  void _showAppLicenses() {
    showAboutDialog(
      context: context,
      applicationName: 'DacTest.',
      applicationVersion: '1.0.0',
    );
  }
}