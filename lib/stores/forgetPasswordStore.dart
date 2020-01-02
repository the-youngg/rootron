import 'package:mobx/mobx.dart';
import 'package:rootron/models/index.dart';

part 'forgetPasswordStore.g.dart';

class ForgetPasswordStore = _ForgetPasswordStore with _$ForgetPasswordStore ;

abstract class _ForgetPasswordStore with Store {
  @observable
  String tel;

  @observable
  String smsCode;

  @observable
  String newPassword;

  @observable
  String confirmPassword;

  @observable
  String smsCodeButtonText = '发送验证码';

  @observable
  int count = 60;

  @observable
  bool isSmsButtonEnable = true;

  @observable
  bool isObscureText = true;

  @observable
  User resetPasswordUser;
}
