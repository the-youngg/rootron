import 'package:mobx/mobx.dart';
import 'package:rootron/env.dart';
import 'package:rootron/models/index.dart';
import 'package:rootron/models/positions.dart';
import 'package:rootron/services/user_service.dart';

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
    UserService.getHouseInfosByUserId(userId).then((data) {
      houseInfoList = data;
    });
  }
}

UserStore $store = UserStore();
