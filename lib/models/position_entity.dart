import 'package:rootron/models/door_entity.dart';

class PositionEntity {
  List<DoorEntity> doors;
  int level;
  String name;
  List<PositionEntity> positions;
  int id;

  PositionEntity({this.doors, this.level, this.name, this.positions, this.id});

  PositionEntity.fromJson(Map<String, dynamic> json) {
    if (json['doors'] != null) {
      doors = new List<DoorEntity>();
      (json['doors'] as List).forEach((v) {
        doors.add(new DoorEntity.fromJson(v));
      });
    }
    level = json['level'];
    name = json['name'];
    if (json['positions'] != null) {
      positions = new List<PositionEntity>();
      (json['positions'] as List).forEach((v) {
        positions.add(new PositionEntity.fromJson(v));
      });
    }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.doors != null) {
      data['doors'] = this.doors.map((v) => v.toJson()).toList();
    }
    data['level'] = this.level;
    data['name'] = this.name;
    if (this.positions != null) {
      data['positions'] = this.positions.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    return data;
  }
}

class PositionList {
  List<PositionEntity> positions;

  PositionList({this.positions});

  factory PositionList.fromJson(List<dynamic> parsedJson) {
    List<PositionEntity> positions = new List<PositionEntity>();
    positions = parsedJson.map((i) => PositionEntity.fromJson(i)).toList();

    return new PositionList(positions: positions);
  }
}
