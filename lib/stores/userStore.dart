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

  // fixme 进入开门页面的时候有时候会报错，是因为异步的情况下该值没做非空处理
  @action
  Future getHouseInfoList(int userId) async {
    var url = '/houseInfos/?userId=$userId';
    var data = await Http.get(path: url);
    houseInfoList = HouseInfoList.fromJson(data);
    // todo 只显示未绑定房子

    houseInfoList.houseInfoList.forEach((house) {
      house.checkState = false;
    });
  }
}

UserStore $store = UserStore();
