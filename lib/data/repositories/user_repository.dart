import 'dart:convert';

import 'package:dactest/data/models/user.dart';
import 'package:dactest/data/providers/user_provider.dart';

class UserRepository {
  final UserDataProvider _userDataProvider;
  UserRepository(this._userDataProvider);

  Future<List<UserModel>> getUsersFromCloud() async {
    try {
      final result = await _userDataProvider.getUsersData();
      final data = jsonDecode(result);

      final List<dynamic> xr = data['results'];
      final usersData = xr.map((e) => UserModel.fromMap(e)).toList();

      return usersData;
    } catch (_) {
      throw 'Une erreur serveur inattendue est survenue !!! Veuillez réessayer plus tard...';
    }
  }

  /// Get user info from local storage
  Future<List<UserModel>> getUsersFromLocal() async {
    try {
      return _userDataProvider.readUsers();
    } catch (e) {
      throw 'from retrieving action: $e';
    }
  }

  /// Delete user locally
  Future<int> delete(UserModel user) {
    try {
      return _userDataProvider.deleteUser(user);
    } catch (e) {
      throw 'from deleting action: $e';
    }
  }

  /// Store user locally
  void store(user) {
    try {
      _userDataProvider.insertUser(user);
    } catch (e) {
      throw 'from creating action: $e';
    }
  }

  /// Update user locally
  Future<int> update(UserModel user) {
    try {
      return _userDataProvider.updateUser(user);
    } catch (e) {
      throw 'from updating action: $e';
    }
  }

  /// Insert user locally
  Future<int> insert(UserModel user) {
    try {
      return _userDataProvider.insertUser(user);
    } catch (e) {
      throw 'from updating action: $e';
    }
  }
}