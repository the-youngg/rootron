import 'package:rootron/models/positions.dart';
import 'package:rootron/services/api.dart';
import 'package:rootron/utils/HttpUtils.dart';

class MockService extends API {
  /// 根据用户获取房屋信息
  @override
  Future<HouseInfoList> getHouseInfosByUserId(int userId) async {
    var url = '/houseInfos/?userId=$userId';
    await Future.delayed(Duration(milliseconds: 500));
    var data = await Http.get(path: url);
    return HouseInfoList.fromJson(data);
  }
}
