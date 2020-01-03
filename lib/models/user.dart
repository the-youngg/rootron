import 'dart:convert' show json;

import 'package:rootron/models/BaseModel.dart';

class User extends BaseModel {
  String email;
  String password;
  String tel;
  String username;

  User.fromParams({this.email, this.password, this.tel, this.username});

  factory User(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new User.fromJson(json.decode(jsonStr))
          : new User.fromJson(jsonStr);

  User.fromJson(jsonRes) {
    id = jsonRes['id'];
    createTime = jsonRes['createTime'];
    email = jsonRes['email'];
    password = jsonRes['password'];
    tel = jsonRes['tel'];
    updateTime = jsonRes['updateTime'];
    username = jsonRes['username'];
  }

  @override
  String toString() {
    return '{"id": $id,"createTime": ${createTime != null ? '${json.encode(createTime)}' : 'null'},"email": ${email != null ? '${json.encode(email)}' : 'null'},"password": ${password != null ? '${json.encode(password)}' : 'null'},"tel": ${tel != null ? '${json.encode(tel)}' : 'null'},"updateTime": ${updateTime != null ? '${json.encode(updateTime)}' : 'null'},"username": ${username != null ? '${json.encode(username)}' : 'null'}}';
  }
}

class UserList {
  List<User> users;

  UserList({this.users});

  factory UserList.fromJson(List<dynamic> parsedJson) {
    List<User> users = new List<User>();
    users = parsedJson.map((i) => User.fromJson(i)).toList();

    return new UserList(users: users);
  }
}
