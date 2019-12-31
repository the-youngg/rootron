import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rootron/common/global.dart';
import 'package:rootron/models/index.dart';
import 'package:rootron/models/userInfo.dart';
import 'package:rootron/routes/route.dart';
import 'package:rootron/stores/loginStore.dart';
import 'package:rootron/stores/userStore.dart';
import 'package:rootron/utils/HttpUtils.dart';
import 'package:rootron/utils/LocalStore.dart';

class CommunityApp extends StatefulWidget {
  @override
  _CommunityAppState createState() => _CommunityAppState();
}

class _CommunityAppState extends State<CommunityApp> {
  @override
  void initState() {
    super.initState();

    _getLoginStatus();
  }

  /// 获取登录状态
  Future<void> _getLoginStatus() async {
    await LocalStore.getStringLocalStorage('auth').then((value) {
      Map<String, dynamic> responseJson = json.decode(value);
      Auth auth = new Auth.fromJson(responseJson);
      print(auth.token);
      if (auth.token == null) {
        return;
      }
      Global.token = auth.token;

      ///todo 判断token是否过期
      var url = '/users/${auth.userId}';
      Http.get(path: url).then((data) {
        User user = User.fromJson(data);
        Provider.of<UserStore>(context).currentUser = user;
        Provider.of<UserStore>(context).isLogin = true;
        Provider.of<UserStore>(context).userId = auth.userId;
        Provider.of<UserStore>(context).token = auth.token;
        _getUserInfo(auth.userId);
      }).catchError((error) {
        Provider.of<UserStore>(context).isLogin = false;
        print(error);
      });

    }).catchError((error) {
      print(error);
    });
  }

  ///todo 公共方法
  Future<void> _getUserInfo(int userId) async {
    /// 获取用户房屋信息
    var url2 = '/houseInfos/?userId=$userId';
    var res2 = await Http.get(path: url2);
    HouseInfoList houseInfos = HouseInfoList.fromJson(res2);

    Map<String, List<Door>> map = Map();
    var positionName1;
    var positionName2;
    var positionName3;
    if (houseInfos.houses.length == 0) {
      return;
    }

    /// 遍历用户所拥有的房子
    houseInfos.houses.forEach((house) {
      // todo 房子没绑定用户，可以存起来提供给后面的绑定房子页面
//      if (!house.isBind) {
//        return;
//      }

      /// 获取level为0的信息
      positionName1 = house.position.name;
      map[positionName1] = house.position.doors;

      /// 获取level为1的信息
      if (house.position.positions.length == 0) {
        return;
      }
      house.position.positions.forEach((position) {
        positionName2 = position.name;
        map[positionName1 + positionName2] = position.doors;

        /// 获取level为2的信息
        position.positions.forEach((position) {
          positionName3 = position.name;
          map[positionName1 + positionName2 + positionName3] = position.doors;

          /// todo 获取level为...的信息
          /// todo ...
        });
      });
    });

    Provider.of<UserStore>(context).positionBindDoorList = map;
    print("************$map" + DateTime.now().toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CommunityApp',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.green,
        accentColor: Colors.green,
      ),
      routes: _buildRoutes(),
      initialRoute: CommunityRoute.openDoor,
    );
  }

  _buildRoutes() {
    return Map<String, WidgetBuilder>.fromIterable(
      allRouteList,
      key: (route) => '${route.routeName}',
      value: (route) => route.builderRoute,
    );
  }
}
