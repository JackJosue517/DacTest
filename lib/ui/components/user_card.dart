import 'package:dactest/data/models/user.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:dactest/ui/components/app_snackbar.dart';

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
      color: Colors.white,
      elevation: 0,
      child: ListTile(
        onTap: () => _loadUserDetails(widget.user),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
              widget.user.pic
          ),
        ),
        title: Text(widget.user.username),
        subtitle: Text(widget.user.email),
        trailing: const Icon(LineIcons.angleRight),
      )
    );
  }

  void _loadUserDetails(UserModel user) async{
    final String whatIsIt = await Navigator.of(context).pushNamed('/home/user-details', arguments: user) as String;
    if (whatIsIt.isNotEmpty) {
      switch (whatIsIt){
        /*case 'deleted':
          Navigator.of(context).pop('deleted');*/
        /*case 'updated':
          ScaffoldMessenger.of(context).showSnackBar(AppSnackBar.updateSnackBar);*/
        default:
        //TODO: What to do... I think nothing!
      }
    }
  }
}
