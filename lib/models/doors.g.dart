// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Doors _$DoorsFromJson(Map<String, dynamic> json) {
  return Doors()
    ..id = json['id'] as num
    ..deviceId = json['deviceId'] as String
    ..name = json['name'] as String;
}

Map<String, dynamic> _$DoorsToJson(Doors instance) => <String, dynamic>{
      'id': instance.id,
      'deviceId': instance.deviceId,
      'name': instance.name
    };
