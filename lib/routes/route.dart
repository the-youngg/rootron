import 'package:flutter/material.dart';
import 'package:rootron/widgets/bindhouse.dart';
import 'package:rootron/widgets/binduser.dart';
import 'package:rootron/widgets/login.dart';
import 'package:rootron/widgets/opendoor.dart';

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
}

/// 路由集合
List<CommunityRoute> _buildAllRoutes() {
  final List<CommunityRoute> communityRoutes = <CommunityRoute>[
    CommunityRoute(
        routeName: CommunityRoute.openDoor,
        builderRoute: (BuildContext context) => OpenDoor()),
    CommunityRoute(
        routeName: CommunityRoute.login,
        builderRoute: (BuildContext context) => const Login()),
    CommunityRoute(
        routeName: CommunityRoute.bindUser,
        builderRoute: (BuildContext context) => const BindUser()),
    CommunityRoute(
        routeName: CommunityRoute.bindHouse,
        builderRoute: (BuildContext context) => const BindHouse()),
  ];

  return communityRoutes;
}

final List<CommunityRoute> allRouteList = _buildAllRoutes();
