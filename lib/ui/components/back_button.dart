import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(onPressed: (){
      Navigator.pop(context);
    }, icon: const Icon(LineIcons.angleLeft),);
  }
}