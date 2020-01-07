import 'package:rootron/models/index.dart';
import 'package:rootron/models/positions.dart';
import 'package:rootron/models/userHasHouseInfos.dart';
import 'package:rootron/utils/HttpUtils.dart';

class UserService {
  /// 根据用户id获取用户信息
  static Future<User> getUserByUserId(
    final userId,
  ) async {
    var url = '/users/$userId';
    var res = await Http.get(path: url);
    return User.fromJson(res);
  }

  /// 根据用户获取房屋信息
  static Future<HouseInfoList> getHouseInfosByUserId(
    final userId,
  ) async {
    var url = '/houseInfos/?userId=$userId';
    await Future.delayed(Duration(milliseconds: 500));
    var res = await Http.get(path: url);
    return HouseInfoList.fromJson(res);
  }

  /// 根据用户id获取其所有的房屋列表
  static Future<UserHasHouseInfos> getUserHasHouseInfosByUserId(
    final userId,
  ) async {
    var url = '/userHasHouseInfos/?userId=$userId';
    var res = await Http.get(path: url);
    return UserHasHouseInfos.fromJson(res);
  }

  /// 根据房屋id获取房屋信息
  static Future<HouseInfo> getHouseInfoByHouseId(
    final houseId,
  ) async {
    var url = '/houseInfos/$houseId';
    var res = await Http.get(path: url);
    return HouseInfo.fromJson(res);
  }

  /// 根据位置id获取位置信息
  static Future<Position> getPositionByPositionId(
    final positionId,
  ) async {
    var url = '/positions/$positionId';
    var res = await Http.get(path: url);
    return Position.fromJson(res);
  }

  /// 用户开门
  static openDoor(
    final type,
    final doorValue,
    final userId,
    final createTime,
    final updateTime,
  ) async {
    var url = '/openRecord';
    var data = {
      "type": type,
      "doorId": doorValue,
      "applicant": userId,
      "createTime": createTime,
      "updateTime": updateTime
    };
    return await Http.post(path: url, data: data);
  }

  /// 修改房屋绑定情况
  static updateHouseBindInfoByHouseId(
    final houseId,
    final isBind,
  ) async {
    var url = '/houseInfos/$houseId';
    var data = {"isBind": isBind};
    return await Http.patch(path: url, data: data);
  }

  /// 根据手机号获取用户信息
  static Future<UserList> getUserByTel(
    final tel,
  ) async {
    var url = '/users/?tel=$tel';
    var res = await Http.get(path: url);
    return UserList.fromJson(res);
  }

  /// 修改用户用户名密码
  static updateUserInfoByUserId(
    final userId,
    final username,
    final password,
  ) async {
    var url = '/users/$userId';
    var data = {"username": username, "password": password};
    return await Http.patch(path: url, data: data);
  }

}
