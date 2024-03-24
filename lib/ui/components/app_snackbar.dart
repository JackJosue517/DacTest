import 'package:dactest/ui/configs/styles.dart';
import 'package:flutter/material.dart';

class AppSnackBar {
  /// Show app info snackbar
  static SnackBar infoSnackBar = SnackBar(
    content: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'En cours de développement...',
        textAlign: TextAlign.center,
        style: AppTexts.headline5,
      ),
    ),
    backgroundColor: AppColors.darkColor,
  );

  /// USER DELETED Snackbar
  static SnackBar deleteSnackBar = SnackBar(
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Données supprimées avec succès !!!',
          textAlign: TextAlign.center,
          style: AppTexts.headline5,
        ),
      ),
    backgroundColor: AppColors.redColor,
  );

  /// USER UPDATED Snackbar
  static SnackBar updateSnackBar = SnackBar(
    content: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Données mises à jour avec succès !!!',
        textAlign: TextAlign.center,
        style: AppTexts.headline5,
      ),
    ),
    backgroundColor: AppColors.greenColor,
  );

  /// USER INSERTED Snackbar
  static SnackBar insertSnackBar = SnackBar(
    content: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Vous avez ajouté avec succès une nouvelle entrée d'utilisateur !!!",
        textAlign: TextAlign.center,
        style: AppTexts.headline5,
      ),
    ),
    backgroundColor: AppColors.greenColor,
  );
}