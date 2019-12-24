// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'houseInfos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HouseInfos _$HouseInfosFromJson(Map<String, dynamic> json) {
  return HouseInfos()
    ..id = json['id'] as num
    ..userId = json['userId'] as num
    ..isBind = json['isBind'] as bool
    ..positionId = json['positionId'] as num;
}

Map<String, dynamic> _$HouseInfosToJson(HouseInfos instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'isBind': instance.isBind,
      'positionId': instance.positionId
    };
