import 'package:json_annotation/json_annotation.dart';

part 'userHasHouseInfos.g.dart';

@JsonSerializable()
class UserHasHouseInfo {
  UserHasHouseInfo();

  int id;
  int userId;
  int houseInfoId;

  factory UserHasHouseInfo.fromJson(Map<String, dynamic> json) =>
      _$UserHasHouseInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserHasHouseInfoToJson(this);
}

class UserHasHouseInfos {
  List<UserHasHouseInfo> userHasHouseInfos;

  UserHasHouseInfos({this.userHasHouseInfos});

  factory UserHasHouseInfos.fromJson(List<dynamic> parsedJson) {
    List<UserHasHouseInfo> userHasHouseInfos = new List<UserHasHouseInfo>();
    userHasHouseInfos =
        parsedJson.map((i) => UserHasHouseInfo.fromJson(i)).toList();

    return new UserHasHouseInfos(userHasHouseInfos: userHasHouseInfos);
  }
}
