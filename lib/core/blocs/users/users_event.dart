part of 'users_bloc.dart';

@immutable
sealed class UsersEvent {}

final class UsersFetched extends UsersEvent {}

final class UsersInserted extends UsersEvent {
  final UserModel user;
  UsersInserted(this.user);
}

final class UsersRetrieved extends UsersEvent {}

final class UsersUpdated extends UsersEvent {
  final UserModel user;
  UsersUpdated(this.user);
}

final class UsersDeleted extends UsersEvent {
  final UserModel user;
  UsersDeleted(this.user);
}