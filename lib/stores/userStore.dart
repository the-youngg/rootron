import 'package:mobx/mobx.dart';
import 'package:rootron/models/index.dart';
import 'package:rootron/models/userInfo.dart';

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

  // fixme 进入开门页面的时候有时候会报错，是因为异步的情况下该值没做非空处理
  @observable
  Map<String, List<Door>> positionBindDoorList = {};
}
