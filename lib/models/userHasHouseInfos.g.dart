// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userHasHouseInfos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserHasHouseInfo _$UserHasHouseInfoFromJson(Map<String, dynamic> json) {
  return UserHasHouseInfo()
    ..id = json['id'] as int
    ..userId = json['userId'] as int
    ..houseInfoId = json['houseInfoId'] as int;
}

Map<String, dynamic> _$UserHasHouseInfoToJson(UserHasHouseInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'houseInfoId': instance.houseInfoId
    };
