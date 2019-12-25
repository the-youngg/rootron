class PositionEntity {
  List<int> doorIds;
  List<int> positionIds;
  int level;
  String name;
  int id;

  PositionEntity(
      {this.doorIds, this.positionIds, this.level, this.name, this.id});

  PositionEntity.fromJson(Map<String, dynamic> json) {
    doorIds = json['doorIds']?.cast<int>();
    positionIds = json['positionIds']?.cast<int>();
    level = json['level'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doorIds'] = this.doorIds;
    data['positionIds'] = this.positionIds;
    data['level'] = this.level;
    data['name'] = this.name;
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
