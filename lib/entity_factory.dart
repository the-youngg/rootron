import 'package:rootron/models/door_entity.dart';
import 'package:rootron/models/house_entity.dart';
import 'package:rootron/models/position_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "PositionEntity") {
      return PositionEntity.fromJson(json) as T;
    } else if (T.toString() == "DoorEntity") {
      return DoorEntity.fromJson(json) as T;
    } else if (T.toString() == "HouseEntity") {
      return HouseEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}
