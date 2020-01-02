import 'package:flutter/material.dart';
import 'package:rootron/widgets/bindhouse.dart';
import 'package:rootron/widgets/binduser.dart';
import 'package:rootron/widgets/forgetPassword_phone.dart';
import 'package:rootron/widgets/forgetPassword_smsCode.dart';
import 'package:rootron/widgets/login.dart';
import 'package:rootron/widgets/openSuccess.dart';
import 'package:rootron/widgets/opendoor.dart';
import 'package:rootron/widgets/resetPassword.dart';
import 'package:rootron/widgets/resetPasswordSuccess.dart';

class CommunityRoute {
  const CommunityRoute({@required this.routeName, @required this.builderRoute})
      : assert(routeName != null),
        assert(builderRoute != null);

  final String routeName;
  final WidgetBuilder builderRoute;

  /// 开门
  static String openDoor = '/';

  /// 登录
  static String login = '/login';

  /// 绑定用户
  static String bindUser = '/bindUser';

  /// 绑定房屋
  static String bindHouse = '/bindHouse';

  /// 开门成功
  static String openSuccess = '/success';

  /// 找回密码 - 填写手机号
  static String forgetPasswordPhone = '/forgetPasswordPhone';

  /// 找回密码 - 填写验证码
  static String forgetPasswordSmsCode = '/forgetPasswordSmsCode';

  /// 重置密码
  static String resetPassword = '/resetPassword';

  /// 重置密码成功
  static String resetPasswordSuccess = 'resetPasswordSuccess';
}

/// 路由集合
List<CommunityRoute> _buildAllRoutes() {
  final List<CommunityRoute> communityRoutes = <CommunityRoute>[
    CommunityRoute(
        routeName: CommunityRoute.openDoor,
        builderRoute: (BuildContext context) => OpenDoor()),
    CommunityRoute(
        routeName: CommunityRoute.login,
        builderRoute: (BuildContext context) => Login()),
    CommunityRoute(
        routeName: CommunityRoute.bindUser,
        builderRoute: (BuildContext context) => const BindUser()),
    CommunityRoute(
        routeName: CommunityRoute.bindHouse,
        builderRoute: (BuildContext context) => const BindHouse()),
    CommunityRoute(
        routeName: CommunityRoute.openSuccess,
        builderRoute: (BuildContext context) => OpenSuccess()),
    CommunityRoute(
        routeName: CommunityRoute.forgetPasswordPhone,
        builderRoute: (BuildContext context) => ForgetPasswordPhone()),
    CommunityRoute(
        routeName: CommunityRoute.forgetPasswordSmsCode,
        builderRoute: (BuildContext context) => ForgetPasswordSmsCode()),
    CommunityRoute(
        routeName: CommunityRoute.resetPassword,
        builderRoute: (BuildContext context) => ResetPassword()),
    CommunityRoute(
        routeName: CommunityRoute.resetPasswordSuccess,
        builderRoute: (BuildContext context) => ResetPasswordSuccess()),
  ];

  return communityRoutes;
}

final List<CommunityRoute> allRouteList = _buildAllRoutes();
