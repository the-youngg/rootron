import 'package:mobx/mobx.dart';

part 'loginStore.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  bool isLoading = false;

  @observable
  String username;

  @observable
  String password;

  @observable
  bool obscureText = true;
}
