import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:rootron/common/global.dart';
import 'package:rootron/models/index.dart';
import 'package:rootron/models/positions.dart';
import 'package:rootron/models/userHasHouseInfos.dart';
import 'package:rootron/routes/route.dart';
import 'package:rootron/stores/userStore.dart';
import 'package:rootron/utils/CommonLocalizationsDelegate.dart';
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
    /// 获取渲染页面的 Map 数据
    Map<String, List<Device>> map = Map();
    var url1 = '/userHasHouseInfos/?userId=$userId';
    await Http.get(path: url1).then((res1) {
      UserHasHouseInfos userHasHouseInfos = UserHasHouseInfos.fromJson(res1);
      if (userHasHouseInfos.userHasHouseInfos.length == 0) {
        return;
      }
      userHasHouseInfos.userHasHouseInfos.forEach((infos) {
        var url2 = '/houseInfos/${infos.houseInfoId}';
        Http.get(path: url2).then((res2) {
          HouseInfo houseInfo = HouseInfo.fromJson(res2);
          if (houseInfo == null) {
            return;
          }

          var url3 = '/positions/${houseInfo.positionId}';
          Http.get(path: url3).then((res3) {
            Position position = Position.fromJson(res3);
            var pointer = position;

            while (pointer.parent != null) {
              map[pointer.name] = pointer.devices;
              pointer = pointer.parent;
            }
            Provider.of<UserStore>(context).positionBindDeviceList = map;
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'CommunityApp',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.green,
          accentColor: Colors.green,
          buttonTheme: ButtonThemeData(
              shape: StadiumBorder(side: BorderSide.none),
              height: 50.0,
              minWidth: double.infinity,
              buttonColor: Colors.green,
              textTheme: ButtonTextTheme.primary),
        ),
        routes: _buildRoutes(),
        initialRoute: CommunityRoute.openDoor,
        locale: Locale('zh', 'CN'),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,

          ///自定义代理，见下段代码
          CommonLocalizationsDelegate(),
        ],
        supportedLocales: [
          Locale('en', 'US'),
          Locale('zh', 'CN'),
        ]);
  }

  _buildRoutes() {
    return Map<String, WidgetBuilder>.fromIterable(
      allRouteList,
      key: (route) => '${route.routeName}',
      value: (route) => route.builderRoute,
    );
  }
}
