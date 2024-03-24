import 'package:dactest/data/models/user.dart';
import 'package:dactest/ui/components/back_button.dart';
import 'package:dactest/ui/configs/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments as UserModel;

    return Scaffold(
        body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            floating: true,
            snap: false,
            pinned: true,
            leading: const GoBackButton(),
            expandedHeight: 350,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(color: Colors.white, width: 300, child: Center(child: CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(user.pic),
              ),
              ),),
            ),
            title: Text(user.username),
            actions: <IconButton>[
              IconButton(
                  onPressed: () => _editUserData(user),
                  icon: const Icon(LineIcons.editAlt))
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildUserTile(label: "Numéro d'identité", data: user.id),
                  buildUserTile(label: "Nom d'utilisateur", data: user.username),
                  buildUserTile(label: "Email", data: user.email),
                  buildUserTile(label: "Télephone", data: user.phone),
                  buildUserTile(label: "Ayant rejoint le", data: DateFormat.yMEd().add_jms().format(user.registeredDate)),
                  buildUserTile(label: "Mot de passe", data: user.password.replaceAll(RegExp(r'.'), '*')),
                  buildUserTile(label: "Biographie", data: lorem(paragraphs: 7, words: 150)),
                ],
              ),
            ),
          )
        ],
      )
    );
  }

  /// Build Custom user tile
  ClipRRect buildUserTile({required String label, required dynamic data}) {
    return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label),
                    Text(
                      data.toString(),
                      textAlign: TextAlign.justify,
                      style: AppTexts.headline4,
                    ),
                  ],
                ),
              ),
            );
  }

  /// Build function to update user data locally
  void _editUserData(UserModel user) async {
    final flag = await Navigator.of(context).pushNamed('/home/add-user', arguments: user);
    print('flag: $flag');
    Navigator.of(context).pop(flag);
  }
}
