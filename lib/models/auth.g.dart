// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Auth _$AuthFromJson(Map<String, dynamic> json) {
  return Auth()
    ..token = json['token'] as String
    ..userId = json['userId'] as num;
}

Map<String, dynamic> _$AuthToJson(Auth instance) =>
    <String, dynamic>{'token': instance.token, 'userId': instance.userId};
