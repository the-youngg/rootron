import 'package:mobx/mobx.dart';
import 'package:rootron/models/userInfo.dart';

part 'doorStore.g.dart';

class DoorStore = _DoorStore with _$DoorStore;

abstract class _DoorStore with Store {
  @observable
  String positionValue;

  @observable
  String doorValue;

  @observable
  List<String> positions;

  @observable
  List<Door> doors;
}
