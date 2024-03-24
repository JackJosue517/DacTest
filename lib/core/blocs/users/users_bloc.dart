import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dactest/data/models/user.dart';
import 'package:dactest/data/repositories/user_repository.dart';
import 'package:meta/meta.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UserRepository userRepository;

  UsersBloc(this.userRepository) : super(UsersInitial()) {
    on<UsersFetched>(_fetchUsersFromCloud);
    on<UsersRetrieved>(_fetchUsersFromLocal);
    on<UsersDeleted>(_deleteLocalUser);
    on<UsersUpdated>(_updateLocalUser);
    on<UsersInserted>(_insertLocalUser);
  }

  void _fetchUsersFromCloud(UsersEvent event, Emitter<UsersState> emit) async{
    emit(UsersLoading());

    try{
      final List<UserModel> usersList = await userRepository.getUsersFromCloud();
      //* Major request allowed here to store cloud values
      Future.microtask(() => {
        _storeDataLocally(usersList)
      });

      emit(UsersSuccess(users: usersList));
    } catch (ex) {
      emit(UsersFailure('from fetch cloud: $ex'));
    }
  }

  void _fetchUsersFromLocal(UsersEvent event, Emitter<UsersState> emit) async{
    emit(UsersLoading());

    try{
      final List<UserModel> usersList = await userRepository.getUsersFromLocal();
      print('from local db: $usersList');
      emit(UsersSuccess(users: usersList));
    } catch (ex) {
      emit(UsersFailure('from fetch local: $ex'));
    }
  }

  void _deleteLocalUser(event, Emitter<UsersState> emit) async{
    emit(UsersLoading());

    await Future.delayed(const Duration(seconds: 2));
    try{
      final int flag = await userRepository.delete(event.user);
      emit(
          UsersSuccess(
              users: await userRepository.getUsersFromLocal(),
              flag: flag,
              action: 'deleted'
          )
      );
    } catch (ex) {
      emit(UsersFailure('$ex'));
    }
  }

  void _updateLocalUser(event, Emitter<UsersState> emit) async{
    emit(UsersLoading());

    await Future.delayed(const Duration(seconds: 2));
    try{
      final int flag = await userRepository.update(event.user);
      emit(
          UsersSuccess(
              users: await userRepository.getUsersFromLocal(),
              flag: flag,
              action: 'updated'
          )
      );
    } catch (ex) {
      emit(UsersFailure('$ex'));
    }
  }

  FutureOr<dynamic> _storeDataLocally(List<UserModel> usersList) {
    print(usersList);
    for (var user in usersList) {
      userRepository.store(user);
    }
    print('data stored locally');
  }

  void _insertLocalUser(event, Emitter<UsersState> emit) async {
    emit(UsersLoading());

    await Future.delayed(const Duration(seconds: 2));
    try{
      final int flag = await userRepository.insert(event.user);
      emit(
          UsersSuccess(
              users: await userRepository.getUsersFromLocal(),
              flag: flag,
              action: 'inserted'
          )
      );
    } catch (ex) {
      emit(UsersFailure('$ex'));
    }
  }
}
