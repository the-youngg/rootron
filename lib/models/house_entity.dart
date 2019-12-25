class HouseEntity {
  int positionId;
  bool isBind;
  int id;
  int userId;

  HouseEntity({this.positionId, this.isBind, this.id, this.userId});

  HouseEntity.fromJson(Map<String, dynamic> json) {
    positionId = json['positionId'];
    isBind = json['isBind'];
    id = json['id'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['positionId'] = this.positionId;
    data['isBind'] = this.isBind;
    data['id'] = this.id;
    data['userId'] = this.userId;
    return data;
  }
}

class HouseList {
  List<HouseEntity> houses;

  HouseList({this.houses});

  factory HouseList.fromJson(List<dynamic> parsedJson) {
    List<HouseEntity> houses = new List<HouseEntity>();
    houses = parsedJson.map((i) => HouseEntity.fromJson(i)).toList();

    return new HouseList(houses: houses);
  }
}
