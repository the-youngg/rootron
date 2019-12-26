import 'package:rootron/models/open_record_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "OpenRecordEntity") {
      return OpenRecordEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}