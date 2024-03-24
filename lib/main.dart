import 'package:dactest/core/blocs/app/app_bloc.dart';
import 'package:dactest/core/blocs/users/users_bloc.dart';
import 'package:dactest/core/observers/app_observer.dart';
import 'package:dactest/data/providers/user_provider.dart';
import 'package:dactest/data/repositories/user_repository.dart';
import 'package:dactest/ui/configs/themes.dart';
import 'package:dactest/ui/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  assert((){
    _deleteDb();
    return true;
  }());
  runApp(const MyApp());
}

void _deleteDb() async {
  final dbPath = join(await getDatabasesPath(), 'users_database.db');
  await deleteDatabase(dbPath);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserRepository(UserDataProvider()),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UsersBloc(context.read<UserRepository>()),
          ),
          BlocProvider(
            create: (context) => AppBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'DacTest',
          theme: AppTheme.buildTheme(Brightness.light),
          onGenerateRoute: AppRouter.onGenerateRoute,
        ),
      ),
    );
  }
}
