import 'package:rootron/models/positions.dart';

/// 所有请求
abstract class API {
  Future<HouseInfoList> getHouseInfosByUserId(int userId);
}
