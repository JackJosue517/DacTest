import 'package:dactest/data/models/user.dart';
import 'package:dactest/ui/components/user_card.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _result = [
    UserModel(id: 1),
    UserModel(id: 2),
    UserModel(id: 3),
  ]; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DacTest.'),
        centerTitle: false,
        actions: <IconButton>[
          IconButton(
            onPressed: _buildSearch,
            icon: const Icon(LineIcons.search,),
          ),
          IconButton(
            onPressed: _buildSettings,
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _result.length,
        itemBuilder: (context, index) => UserCard(user: _result[index],),
      ),
    );
  }
  
  /// Build search core logic
  void _buildSearch() {

  }

  /// Build settings core logic
  void _buildSettings() {

  }
}