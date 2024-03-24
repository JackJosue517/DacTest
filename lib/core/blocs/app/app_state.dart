part of 'app_bloc.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {
  final bool isDark = false;
}

final class AppLight extends AppState {
  final bool isDark = false;
}

final class AppDark extends AppState {
  final bool isDark = true;
}