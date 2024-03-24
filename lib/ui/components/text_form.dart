import 'package:dactest/ui/configs/styles.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class TextFormWidget extends StatefulWidget {
  const TextFormWidget({
    super.key,
    required this.txtController,
    required this.label,
    required this.icon,
  });
  final TextEditingController txtController;
  final String label;
  final IconData icon;

  @override
  State<TextFormWidget> createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
      child: TextFormField(
        controller: widget.txtController,
        decoration: InputDecoration(
          prefixIcon: Icon(
              widget.icon,
            size: 35,
          ),
          labelText: widget.label,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor, width: 2.0)
          ),
          hintText: 'Veuillez saisir votre ${widget.label.toLowerCase()}',
        ),
        onChanged: (value) {
          widget.txtController.text = value;
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Veuillez spécifier une valeur';
          }
          if(value.length < 6) {
            return 'Vous devez entrer un minimum de 06 caractères';
          }
          return null;
        },
      ),
    );
  }
}
