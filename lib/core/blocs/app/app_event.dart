part of 'app_bloc.dart';

@immutable
sealed class AppEvent {}

final class ThemeChanged extends AppEvent {
  final bool isDark;

  ThemeChanged(this.isDark);
}