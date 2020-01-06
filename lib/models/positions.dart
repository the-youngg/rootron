import 'dart:convert' show json;

import 'package:rootron/models/BaseModel.dart';

class Positions {
  List<Position> list;

  Positions.fromParams({this.list});

  factory Positions(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new Positions.fromJson(json.decode(jsonStr))
          : new Positions.fromJson(jsonStr);

  Positions.fromJson(jsonRes) {
    list = jsonRes['json_list'] == null ? null : [];

    for (var listItem in list == null ? [] : jsonRes['json_list']) {
      list.add(listItem == null ? null : new Position.fromJson(listItem));
    }
  }

  @override
  String toString() {
    return '{"json_list": $list}';
  }
}

class Position extends BaseModel {
  int level;
  bool houseFlag;
  String name;
  List<Device> devices;
  HouseInfo houseInfo;
  Position parent;

  Position.fromParams(
      {this.level,
      this.houseFlag,
      this.name,
      this.devices,
      this.houseInfo,
      this.parent});

  Position.fromJson(jsonRes) {
    id = jsonRes['id'];
    level = jsonRes['level'];
    houseFlag = jsonRes['houseFlag'];
    name = jsonRes['name'];
    createTime = jsonRes['createTime'];
    updateTime = jsonRes['updateTime'];
    devices = jsonRes['devices'] == null ? null : [];

    for (var devicesItem in devices == null ? [] : jsonRes['devices']) {
      devices
          .add(devicesItem == null ? null : new Device.fromJson(devicesItem));
    }

    houseInfo = jsonRes['houseInfo'] == null
        ? null
        : new HouseInfo.fromJson(jsonRes['houseInfo']);
    parent = jsonRes['parent'] == null
        ? null
        : new Position.fromJson(jsonRes['parent']);
  }

  @override
  String toString() {
    return '{"id": $id,"level": $level,"houseFlag": $houseFlag,"name": ${name != null ? '${json.encode(name)}' : 'null'},"devices": $devices,"houseInfo": $houseInfo,"parent":$parent,"createTime": ${createTime != null ? '${json.encode(createTime)}' : 'null'},"updateTime": ${updateTime != null ? '${json.encode(updateTime)}' : 'null'}}';
  }
}

class HouseInfo extends BaseModel {
  int userId;
  int positionId;
  bool isBind;
  bool checkState;

  HouseInfo.fromParams(
      {this.userId, this.isBind, this.positionId, this.checkState});

  HouseInfo.fromJson(jsonRes) {
    id = jsonRes['id'];
    userId = jsonRes['userId'];
    positionId = jsonRes['positionId'];
    isBind = jsonRes['isBind'];
    checkState = jsonRes['checkState'];
    createTime = jsonRes['createTime'];
    updateTime = jsonRes['updateTime'];
  }

  @override
  String toString() {
    return '{"id": $id,"positionId":$positionId,"userId": $userId,"checkState": $checkState,"isBind": $isBind,"createTime": ${createTime != null ? '${json.encode(createTime)}' : 'null'},"updateTime": ${updateTime != null ? '${json.encode(updateTime)}' : 'null'}}';
  }
}

class HouseInfoList {
  List<HouseInfo> houseInfoList;

  HouseInfoList({this.houseInfoList});

  factory HouseInfoList.fromJson(List<dynamic> parsedJson) {
    List<HouseInfo> houseInfoList = new List<HouseInfo>();
    houseInfoList = parsedJson.map((i) => HouseInfo.fromJson(i)).toList();

    return new HouseInfoList(houseInfoList: houseInfoList);
  }
}

class Device extends BaseModel {
  int deviceTypeId;
  int status;
  String deviceId;
  String img;
  String name;

  Device.fromParams(
      {this.deviceTypeId, this.status, this.deviceId, this.img, this.name});

  Device.fromJson(jsonRes) {
    deviceTypeId = jsonRes['deviceTypeId'];
    id = jsonRes['id'];
    status = jsonRes['status'];
    deviceId = jsonRes['deviceId'];
    img = jsonRes['img'];
    name = jsonRes['name'];
    createTime = jsonRes['createTime'];
    updateTime = jsonRes['updateTime'];
  }

  @override
  String toString() {
    return '{"deviceTypeId": $deviceTypeId,"id": $id,"status": $status,"name":$name ,"deviceId": ${deviceId != null ? '${json.encode(deviceId)}' : 'null'},"img": ${img != null ? '${json.encode(img)}' : 'null'},"createTime": ${createTime != null ? '${json.encode(createTime)}' : 'null'},"updateTime": ${updateTime != null ? '${json.encode(updateTime)}' : 'null'}}';
  }
}
