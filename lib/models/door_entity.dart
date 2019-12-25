class DoorEntity {
  String name;
  int id;
  String deviceId;

  DoorEntity({this.name, this.id, this.deviceId});

  DoorEntity.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    deviceId = json['deviceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['deviceId'] = this.deviceId;
    return data;
  }
}

class DoorList {
  List<DoorEntity> doors;

  DoorList({this.doors});

  factory DoorList.fromJson(List<dynamic> parsedJson) {
    List<DoorEntity> doors = new List<DoorEntity>();
    doors = parsedJson.map((i) => DoorEntity.fromJson(i)).toList();

    return new DoorList(doors: doors);
  }
}
