import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){
      Navigator.pop(context);
    }, icon: const Icon(LineIcons.angleLeft),);
  }
}