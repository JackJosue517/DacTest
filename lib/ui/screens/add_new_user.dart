import 'package:dactest/core/blocs/users/users_bloc.dart';
import 'package:dactest/data/models/user.dart';
import 'package:dactest/ui/components/back_button.dart';
import 'package:dactest/ui/components/text_form.dart';
import 'package:dactest/ui/configs/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';

class AddNewUserScreen extends StatefulWidget {
  const AddNewUserScreen({super.key});

  @override
  State<AddNewUserScreen> createState() => _AddNewUserScreenState();
}

class _AddNewUserScreenState extends State<AddNewUserScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _phoneTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  late UserModel _user;

  get user => _user;

  @override
  Widget build(BuildContext context) {
    // Get necessary data and flags
    final object = ModalRoute.of(context)?.settings.arguments;
    bool isAddForm;

    // Build form user in consequence
    if (object == null) {
     _user = UserModel.empty.copyWith(
       pic: 'https://wallpaperaccess.com/full/16225.jpg',
     );
      isAddForm = true;
    } else {
      _user = object as UserModel;
      isAddForm = false;
    }
    _buildFormData(user);

    return Scaffold(
      appBar: AppBar(
        leading: const GoBackButton(),
        title: isAddForm ?
          const Text('Insérer une nouvelle entrée')
          : const Text('Modifier vos informations'),
        actions: [
          !isAddForm ? IconButton(
            icon: const Icon(
              Icons.delete_forever,
              color: AppColors.redColor,
              size: 30,
            ),
            onPressed: () => _deleteUserData(user),
          ) : const Text(''),
        ],
      ),
      body: BlocConsumer<UsersBloc, UsersState>(
  listener: (context, state) {
    if (state is UsersSuccess && state.action == 'deleted') {
      Navigator.of(context).pop('deleted');
    }
    if (state is UsersSuccess && state.action == 'updated') {
      Navigator.of(context).pop('updated');
    }
    if (state is UsersSuccess && state.action == 'inserted') {
      Navigator.of(context).pop('inserted');
    }
  },
  builder: (context, state) {
    if (state is UsersLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state is UsersFailure) {
      return Center(child: Text(state.error));
    }

    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormWidget(
                    label: "Nom d'utilisateur",
                    icon: LineIcons.userAlt,
                    txtController: _usernameTextController,
                  ),
                  TextFormWidget(
                    label: "Adresse mail",
                    icon: LineIcons.addressBookAlt,
                    txtController: _emailTextController,
                  ),
                  TextFormWidget(
                    label: "Numéro de téléphone",
                    icon: LineIcons.phone,
                    txtController: _phoneTextController,
                  ),
                  TextFormWidget(
                    label: "Mot de passe",
                    icon: LineIcons.key,
                    txtController: _passwordTextController,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50,),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                child: OutlinedButton(
                    onPressed: () => _buildLogic(isAddForm, user),
                    style: ButtonStyle(
                      foregroundColor: const MaterialStatePropertyAll<Color>(Colors.white),
                      backgroundColor: const MaterialStatePropertyAll<Color>(AppColors.primaryColor),
                      shape: MaterialStatePropertyAll<OutlinedBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                    ),
                    child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: isAddForm
                            ? Text(
                              'Envoyer',
                              style: AppTexts.headline4,
                          ) :  Text(
                              'Modifier',
                              style: AppTexts.headline4,
                          ),
                        )

                ),
              ),
            ),
          ],
        ),
      );
  },
)
    );
  }

  /// Build user data update or create
  void _buildLogic(bool formValue, UserModel user) {
    if(_formKey.currentState!.validate()) {
      user.copyWith(
        username: _usernameTextController.text,
        email: _emailTextController.text,
        password: _passwordTextController.text,
        phone: _phoneTextController.text,
      );
      print("user: $user");
      if(formValue) {
        // User wants to add new user
        print('insert');
        context.read<UsersBloc>().add(UsersInserted(user));
      } else {
        print('update');
        context.read<UsersBloc>().add(UsersUpdated(user));
      }
    }
  }

  /// Build user form with autocomplete data to editing
  void _buildFormData(UserModel user) {
    _usernameTextController.text = user.username;
    _emailTextController.text = user.email;
    _phoneTextController.text = user.phone;
    _passwordTextController.text = user.password;
  }

  /// User want finally delete these infos
  void _deleteUserData(UserModel user) {
    showDialog(
        barrierDismissible: false,
        context: context, builder: (context) => AlertDialog(
      backgroundColor: AppColors.whiteColor,
      title: const Text('Suppression de données'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "Voulez-vous supprimer les données relatifs à l'utilisateur ${user.username} ?"
          ),
          const Text(
              "Toutes les données associées seront perdues pour toujours !!!"
          ),
          const Text("Toutefois, vous pouvez les récupérer par synchronisation..."),
        ],
      ),
      actions: [
        TextButton(
            onPressed: _undoAction,
            child: Text(
                'Annuler',
              style: AppTexts.headline5.copyWith(color: AppColors.darkColor),
            )
        ),
        TextButton(onPressed: _confirmAction, child: Text(
            "J'ai compris",
            style: AppTexts.headline5.copyWith(color: AppColors.redColor),
        ))
      ],
    ));
  }

  /// Avoid delete user sensitive info
  void _undoAction() {
    Navigator.of(context).pop();
  }

  /// User is okay
  void _confirmAction() {
    Navigator.of(context).pop();
    context.read<UsersBloc>().add(UsersDeleted(user));
  }
}