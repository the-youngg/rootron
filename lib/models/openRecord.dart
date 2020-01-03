import 'dart:convert' show json;

import 'package:rootron/models/BaseModel.dart';

class OpenRecord extends BaseModel {
  int applicant;
  int positionId;
  String doorId;
  String type;

  OpenRecord.fromParams(
      {this.applicant, this.positionId, this.doorId, this.type});

  factory OpenRecord(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new OpenRecord.fromJson(json.decode(jsonStr))
          : new OpenRecord.fromJson(jsonStr);

  OpenRecord.fromJson(jsonRes) {
    applicant = jsonRes['applicant'];
    id = jsonRes['id'];
    positionId = jsonRes['positionId'];
    doorId = jsonRes['doorId'];
    type = jsonRes['type'];
    createTime = jsonRes['createTime'];
    updateTime = jsonRes['updateTime'];
  }

  @override
  String toString() {
    return '{"applicant": $applicant,"id": $id,"positionId": $positionId,"doorId": ${doorId != null ? '${json.encode(doorId)}' : 'null'},"type": ${type != null ? '${json.encode(type)}' : 'null'},"createTime": ${createTime != null ? '${json.encode(createTime)}' : 'null'},"updateTime": ${updateTime != null ? '${json.encode(updateTime)}' : 'null'}}';
  }
}
