import 'package:json_annotation/json_annotation.dart';

part 'userHasHouseInfos.g.dart';

@JsonSerializable()
class UserHasHouseInfos {
    UserHasHouseInfos();

    num id;
    num userId;
    num houseInfoId;
    
    factory UserHasHouseInfos.fromJson(Map<String,dynamic> json) => _$UserHasHouseInfosFromJson(json);
    Map<String, dynamic> toJson() => _$UserHasHouseInfosToJson(this);
}
