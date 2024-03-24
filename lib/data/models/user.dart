// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:uuid/uuid.dart';

class UserModel {
  final String uid;
  final String username;
  final String email;
  final String phone;
  final DateTime registeredDate;
  final String password;
  final String pic;
  int? id;

  UserModel(
      this.uid,
      this.username,
      this.email,
      this.phone,
      this.registeredDate,
      this.password,
      this.pic,
      this.id,
      );



  UserModel copyWith({
    String? uid,
    String? username,
    String? email,
    String? phone,
    DateTime? registeredDate,
    String? password,
    String? pic,
    int? id,
  }) {
    return UserModel(
      uid ?? this.uid,
      username ?? this.username,
      email ?? this.email,
      phone ?? this.phone,
      registeredDate ?? this.registeredDate,
      password ?? this.password,
      pic ?? this.pic,
      id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'username': username,
      'email': email,
      'phone': phone,
      'registeredDate': registeredDate.millisecondsSinceEpoch,
      'password': password,
      'pic': pic,
      'id': id,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['login']['uuid'] as String,
      map['login']['username'] as String,
      map['email'] as String,
      map['phone'] as String,
      DateTime.tryParse(map['registered']['date'] as String) ?? DateTime.now(),
      map['login']['password'] as String,
      map['picture']['medium'] as String,
      null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(uid: $uid, username: $username, email: $email, phone: $phone, registeredDate: $registeredDate, password: $password, pic: $pic, id: $id';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return
      other.uid == uid &&
      other.username == username &&
      other.email == email &&
      other.phone == phone &&
      other.registeredDate == registeredDate &&
      other.password == password &&
      other.pic == pic &&
          other.id == id;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
      username.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      registeredDate.hashCode ^
      password.hashCode ^
      pic.hashCode ^
      id.hashCode;
  }

  static UserModel get empty => UserModel(const Uuid().v4(), '', '', '', DateTime.now(), '', '', null);
}