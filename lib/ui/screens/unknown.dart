import 'package:dactest/ui/components/back_button.dart';
import 'package:flutter/material.dart';

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const GoBackButton(),
        title: const Text('Erreur de navigation'),
      ),
      body: const Center(
        child: Text('Route de navigation inconnue !!!!')
      ),
    );
  }
}