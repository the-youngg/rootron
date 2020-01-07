import 'package:rootron/models/auth.dart';
import 'package:rootron/utils/HttpUtils.dart';

class LoginService {
  /// 用户登录
  static Future<Auth> login(
    final username,
    final password,
  ) async {
    const url = '/authenticate';
    var data = {"username": username, "password": password};
    var res = await Http.post(path: url, data: data);
    return Auth.fromJson(res);
  }
}
