// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userHasHouseInfos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserHasHouseInfos _$UserHasHouseInfosFromJson(Map<String, dynamic> json) {
  return UserHasHouseInfos()
    ..id = json['id'] as num
    ..userId = json['userId'] as num
    ..houseInfoId = json['houseInfoId'] as num;
}

Map<String, dynamic> _$UserHasHouseInfosToJson(UserHasHouseInfos instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'houseInfoId': instance.houseInfoId
    };
