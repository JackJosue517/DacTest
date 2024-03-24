part of 'users_bloc.dart';

@immutable
sealed class UsersState {}

final class UsersInitial extends UsersState {}

final class UsersFailure extends UsersState {
  final String error;
  UsersFailure(this.error);
}

final class UsersSuccess extends UsersState {
  final List<UserModel> users;
  final int? flag;
  final String? action;
  UsersSuccess({required this.users, this.flag, this.action});
}

final class UsersLoading extends UsersState {}