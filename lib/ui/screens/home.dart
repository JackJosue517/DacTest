import 'package:dactest/core/blocs/users/users_bloc.dart';
import 'package:dactest/ui/components/app_snackbar.dart';
import 'package:dactest/ui/components/custom_search.dart';
import 'package:dactest/ui/components/user_card.dart';
import 'package:dactest/ui/configs/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    context.read<UsersBloc>().add(UsersRetrieved());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DacTest.'),
        centerTitle: false,
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        actions: <IconButton>[
          IconButton(
            onPressed: () => _buildSearch(context),
            icon: const Icon(LineIcons.search,),
          ),
          IconButton(
            onPressed: _buildSettings,
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: BlocBuilder<UsersBloc, UsersState>(
          builder: (context, state) {
            if(state is UsersFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/img/404.png'),
                    Text(state.error, textAlign: TextAlign.center,),
                    TextButton.icon(onPressed: (){
                      context.read<UsersBloc>().add(UsersRetrieved());
                    }, icon: const Icon(Icons.refresh_outlined), label: Text('Réessayer', style: AppTexts.headline4,)),
                  ],
                ),
              );
            }
            if(state is! UsersSuccess) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }

            final usersList = state.users;

            return usersList.isEmpty ? Center(
              child: Column(
                children: [
                  Image.asset('assets/img/500.png'),
                  Text('Historique de données vide...', style: AppTexts.headline4,),
                  const SizedBox(height: 60),
                  TextButton.icon(onPressed: (){
                    context.read<UsersBloc>().add(UsersFetched());
                  }, icon: const Icon(LineIcons.alternateCloudDownload), label: Text('Synchroniser', style: AppTexts.headline4,)),
                ],
              )
            ) : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.builder(
                itemCount: usersList.length,
                itemBuilder: (context, index) => UserCard(user: usersList[index],),
              ),
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor.withAlpha(200),
        foregroundColor: Colors.white,
        onPressed: () => _addNewUser(),
        child: const Icon(LineIcons.plus),
      ),
    );
  }
  
  /// Build search core logic
  void _buildSearch(BuildContext context) async {
    final result = await showSearch(context: context, delegate: CustomSearchDelegate());
    if(result != null){
      if (!mounted) return;
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushNamed('/home/searchview');
    }
  }

  /// Build settings core logic
  void _buildSettings() {
    Navigator.of(context).pushNamed('/home/settings');
  }

  /// Refresh data on Home Page
  Future<void> _refreshData() async {
    context.read<UsersBloc>().add(UsersRetrieved());
  }

  /// Load add user screen
  void _addNewUser() async {
    final String whatIsIt = await Navigator.of(context).pushNamed('/home/add-user') as String;
    if (whatIsIt.isNotEmpty) {
      switch (whatIsIt){
        case 'deleted':
          ScaffoldMessenger.of(context).showSnackBar(AppSnackBar.deleteSnackBar);
        case 'inserted':
          ScaffoldMessenger.of(context).showSnackBar(AppSnackBar.insertSnackBar);
        default:
          //TODO: What to do... I think nothing!
      }
    }
  }
}