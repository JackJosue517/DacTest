import 'package:dactest/data/models/user.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class UserCard extends StatefulWidget {
  const UserCard({super.key, required this.user});
  final UserModel user;

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(LineIcons.userAlt),
        title: Text(widget.user.id.toString()),
        subtitle: const Text('subtitle'),
        trailing: const Icon(LineIcons.angleRight),
      )
    );
  }
}