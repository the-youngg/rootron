import 'package:json_annotation/json_annotation.dart';

part 'houseInfos.g.dart';

@JsonSerializable()
class HouseInfos {
    HouseInfos();

    num id;
    num userId;
    bool isBind;
    num positionId;
    
    factory HouseInfos.fromJson(Map<String,dynamic> json) => _$HouseInfosFromJson(json);
    Map<String, dynamic> toJson() => _$HouseInfosToJson(this);
}
