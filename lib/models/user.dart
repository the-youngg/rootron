import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User();

  num id;
  String username;
  String password;
  String tel;
  String email;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
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
