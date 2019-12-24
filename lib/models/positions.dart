import 'package:json_annotation/json_annotation.dart';

part 'positions.g.dart';

@JsonSerializable()
class Positions {
    Positions();

    num id;
    String name;
    num level;
    List doorIds;
    List positionIds;
    
    factory Positions.fromJson(Map<String,dynamic> json) => _$PositionsFromJson(json);
    Map<String, dynamic> toJson() => _$PositionsToJson(this);
}
