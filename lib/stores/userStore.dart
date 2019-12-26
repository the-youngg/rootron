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

  @observable
  Map<String, List<Door>> positionBindDoorList;
}
