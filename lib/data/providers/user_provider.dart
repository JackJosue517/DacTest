import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:dactest/data/models/user.dart';

class UserDataProvider {

  /// Fetch cloud random data from RANDOMUSERS API
  Future<String> getUsersData() async {
    try {
      String url = 'https://randomuser.me/api/?results=100';
      var response = await http.get(Uri.parse(url));
      return response.body;
    } catch (e) {
      throw e.toString();
    }
  }

  /// Open SQLite DATABASE
  static Future<Database> _open() async {
    final Database database = await openDatabase(
        join(await getDatabasesPath(), 'users_database.db'),
      onCreate: (db, version) {
          return db.execute('''CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            uid VARCHAR(255) NOT NULL UNIQUE,
            username VARCHAR(255) NOT NULL,
            email VARCHAR(255) NOT NULL UNIQUE, -- Enforce unique emails
            phone VARCHAR(255) NOT NULL,
            password VARCHAR(255) NOT NULL,  -- Consider using a more secure hash for passwords
            registeredDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,  -- Use current timestamp for registration
            pic VARCHAR(255) DEFAULT NULL  -- Allow null for profile picture
          );''');
      },
      version: 1,
    );
    return database;
  }

  /// Insert a new user data into database
  Future<int> insertUser(UserModel user) async {
    final db = await UserDataProvider._open();
    return await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Build function to retrieve the stored users data
  Future<List<UserModel>> readUsers() async {
    final db = await UserDataProvider._open();
    final List<Map<String, dynamic>> usersMap = await db.query('users') ?? [];
    return usersMap.isEmpty ? [] : [
      for (final {
        'id': id,
        'uid': uid,
        'username': username,
        'email': email,
        'phone': phone,
        'registeredDate': registeredDate,
        'password': password,
        'pic': pic,
      } in usersMap)
        UserModel(uid, username, email, phone, DateTime.fromMillisecondsSinceEpoch(registeredDate), password, pic, id),
    ];
  }

  /// Update user data and store locally
  Future<int> updateUser(UserModel user) async {
    final db = await UserDataProvider._open();
    return await db.update(
      'users',
      user.toMap(),
      where: 'uid = ?',
      whereArgs: [user.uid]
    );
  }

  /// Delete user data from data store
  Future<int> deleteUser(UserModel user) async {
    final db = await UserDataProvider._open();
    return await db.delete(
        'users',
        where: 'uid = ?',
        whereArgs: [user.uid]
    );
  }
}