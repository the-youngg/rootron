import 'package:json_annotation/json_annotation.dart';

part 'auth.g.dart';

@JsonSerializable()
class Auth {
    Auth();

    String token;
    num userId;
    
    factory Auth.fromJson(Map<String,dynamic> json) => _$AuthFromJson(json);
    Map<String, dynamic> toJson() => _$AuthToJson(this);
}
