// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'positions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Positions _$PositionsFromJson(Map<String, dynamic> json) {
  return Positions()
    ..id = json['id'] as num
    ..name = json['name'] as String
    ..level = json['level'] as num
    ..doorIds = json['doorIds'] as List
    ..positionIds = json['positionIds'] as List;
}

Map<String, dynamic> _$PositionsToJson(Positions instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'level': instance.level,
      'doorIds': instance.doorIds,
      'positionIds': instance.positionIds
    };
