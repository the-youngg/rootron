import 'package:mobx/mobx.dart';
import 'package:rootron/models/house_entity.dart';
import 'package:rootron/models/position_entity.dart';

part 'userStore.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @observable
  int userId;

  @observable
  String token;

  @observable
  HouseList houseList;

  @observable
  PositionList positionList;
}
