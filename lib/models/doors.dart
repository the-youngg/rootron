import 'package:json_annotation/json_annotation.dart';

part 'doors.g.dart';

@JsonSerializable()
class Doors {
    Doors();

    num id;
    String deviceId;
    String name;
    
    factory Doors.fromJson(Map<String,dynamic> json) => _$DoorsFromJson(json);
    Map<String, dynamic> toJson() => _$DoorsToJson(this);
}
