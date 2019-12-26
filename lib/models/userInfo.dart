import 'dart:convert' show json;

class HouseInfoList {
  List<HouseInfo> houses;

  HouseInfoList({this.houses});

  factory HouseInfoList.fromJson(List<dynamic> parsedJson) {
    List<HouseInfo> houses = new List<HouseInfo>();
    houses = parsedJson.map((i) => HouseInfo.fromJson(i)).toList();

    return new HouseInfoList(houses: houses);
  }
}


class HouseInfo {

  int id;
  int userId;
  bool isBind;
  Position position;

  HouseInfo.fromParams({this.id, this.userId, this.isBind, this.position});

  HouseInfo.fromJson(jsonRes) {
    id = jsonRes['id'];
    userId = jsonRes['userId'];
    isBind = jsonRes['isBind'];
    position = jsonRes['position'] == null ? null : new Position.fromJson(jsonRes['position']);
  }

  @override
  String toString() {
    return '{"id": $id,"userId": $userId,"isBind": $isBind,"position": $position}';
  }
}

class Position {

  int id;
  int level;
  String name;
  List<Door> doors;
  List<Position> positions;

  Position.fromParams({this.id, this.level, this.name, this.doors, this.positions});

  Position.fromJson(jsonRes) {
    id = jsonRes['id'];
    level = jsonRes['level'];
    name = jsonRes['name'];
    doors = jsonRes['doors'] == null ? null : [];

    for (var doorsItem in doors == null ? [] : jsonRes['doors']){
      doors.add(doorsItem == null ? null : new Door.fromJson(doorsItem));
    }

    positions = jsonRes['positions'] == null ? null : [];

    for (var positionsItem in positions == null ? [] : jsonRes['positions']){
      positions.add(positionsItem == null ? null : new Position.fromJson(positionsItem));
    }
  }

  @override
  String toString() {
    return '{"id": $id,"level": $level,"name": ${name != null?'${json.encode(name)}':'null'},"doors": $doors,"positions": $positions}';
  }
}

class Door {

  int id;
  String deviceId;
  String name;

  Door.fromParams({this.id, this.deviceId, this.name});

  Door.fromJson(jsonRes) {
    id = jsonRes['id'];
    deviceId = jsonRes['deviceId'];
    name = jsonRes['name'];
  }

  @override
  String toString() {
    return '{"id": $id,"deviceId": ${deviceId != null?'${json.encode(deviceId)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'}}';
  }
}

