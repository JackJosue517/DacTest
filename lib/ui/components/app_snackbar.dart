import 'package:dactest/ui/configs/styles.dart';
import 'package:flutter/material.dart';

class AppSnackBar {
  /// USER DELETED Snackbar
  static const deleteSnackBar = SnackBar(
      content: Padding(
        padding: EdgeInsets.all(15.0),
        child: Text(
          'Données supprimées avec succès !!!',
          textAlign: TextAlign.center,
        ),
      ),
    backgroundColor: AppColors.redColor,
  );

  /// USER UPDATED Snackbar
  static const updateSnackBar = SnackBar(
    content: Padding(
      padding: EdgeInsets.all(15.0),
      child: Text(
        'Données mises à jour avec succès !!!',
        textAlign: TextAlign.center,
      ),
    ),
    backgroundColor: AppColors.greenColor,
  );

  /// USER INSERTED Snackbar
  static const insertSnackBar = SnackBar(
    content: Padding(
      padding: EdgeInsets.all(15.0),
      child: Text(
        "Vous avez ajouté avec succès une nouvelle entrée d'utilisateur !!!",
        textAlign: TextAlign.center,
      ),
    ),
    backgroundColor: AppColors.greenColor,
  );
}