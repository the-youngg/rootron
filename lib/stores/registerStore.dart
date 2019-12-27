import 'package:mobx/mobx.dart';

part 'registerStore.g.dart';

class RegisterStore = _RegisterStore with _$RegisterStore;

abstract class _RegisterStore with Store {
  @observable
  String username;

  @observable
  String password;

  @observable
  bool isObscureText = true;

  @observable
  String tel;

  @observable
  String smsCode;

  @observable
  String smsCodeButtonText = '发送验证码';

  @observable
  int count = 60;

  @observable
  bool isSmsButtonEnable = true;

}
