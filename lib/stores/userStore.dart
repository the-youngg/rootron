import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:rootron/models/index.dart';
import 'package:rootron/models/positions.dart';
import 'package:rootron/utils/HttpUtils.dart';

part 'userStore.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @observable
  bool isLogin = false;

  @observable
  int userId;

  @observable
  String token;

  @observable
  User currentUser;

  @observable
  Map<String, List<Device>> positionBindDeviceList = {};

  @observable
  HouseInfoList houseInfoList;

  @action
  Future getHouseInfoList(int userId) async {
    var url = '/houseInfos/?userId=$userId';
    await Future.delayed(Duration(milliseconds: 500));
    var data = await Http.get(path: url);
    houseInfoList = HouseInfoList.fromJson(data);
  }
}

UserStore $store = UserStore();
