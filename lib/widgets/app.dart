import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rootron/common/global.dart';
import 'package:rootron/models/door_entity.dart';
import 'package:rootron/models/house_entity.dart';
import 'package:rootron/models/index.dart';
import 'package:rootron/models/position_entity.dart';
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
  void _getLoginStatus() {
    LocalStore.getStringLocalStorage('auth').then((data) {
      if (data == null) {
        return;
      }
      Map<String, dynamic> responseJson = json.decode(data);
      Auth auth = new Auth.fromJson(responseJson);
      print("userId: ${auth.userId}");
      print("token: ${auth.token}");
      if (auth.token == null) {
        return;
      }
      Global.token = "Bearer " + auth.token;

      ///todo 判断token是否过期
      Provider.of<LoginStore>(context).isLogin = true;
      Provider.of<UserStore>(context).userId = auth.userId;
      Provider.of<UserStore>(context).token = auth.token;

      _getUserInfo(auth.userId);
    }).catchError((error) {
      print('获取数据失败$error');
    });
  }

  void _getUserInfo(int userId) async {
    /// 获取用户基本信息
    var url = '/users/$userId';
    Http.get(path: url).then((data) {
      User user = User.fromJson(data);
      print(user.email);
    });

    /// 获取用户房屋信息
    var url2 = '/houseInfos/?userId=$userId';
    var res2 = await Http.get(path: url2);
    print("**********$res2");
    HouseList houseList = HouseList.fromJson(res2);
    Provider.of<UserStore>(context).houseList = houseList;

    /// 获取房子所在的小区位置
    HouseList list = Provider.of<UserStore>(context).houseList;
    list.houses.forEach((house) async {
      List<String> saveList = [];

      if (!house.isBind) {
        /// todo 用户没有绑定该栋房屋，做其他处理
        return;
      }

//      var url3 = '/positions/${house.position.id}';
//      var res3 = await Http.get(path: url3);
//      PositionEntity positionEntity = PositionEntity.fromJson(res3);
//      print("小区名字${positionEntity.name}");
//      print("小区的门${positionEntity.doorIds}");
//      print("小区的街道${positionEntity.positionIds}");
//      saveList.add(positionEntity.name);
//      saveList.add("dasda");
//
//      /// 获取小区下的街道
//      if (positionEntity.positionIds != null) {
//        positionEntity.positionIds.forEach((positionId) async {
//          var url3_1 = '/positions/$positionId';
//          var res3_1 = await Http.get(path: url3_1);
//          PositionEntity positionEntity1 = PositionEntity.fromJson(res3_1);
//          print("小区名字1 ${positionEntity.name + positionEntity1.name}");
//          print("小区的门1 ${positionEntity1.doorIds}");
//          print("小区的街道1 ${positionEntity1.positionIds}");
//          saveList.add(positionEntity.name + positionEntity1.name);
//
//          if (positionEntity1.positionIds != null) {
//            positionEntity1.positionIds.forEach((positionId) async {
//              var url3_2 = '/positions/$positionId';
//              var res3_2 = await Http.get(path: url3_2);
//              PositionEntity positionEntity2 = PositionEntity.fromJson(res3_2);
//              print(
//                  "小区名字2 ${positionEntity.name + positionEntity1.name + positionEntity2.name}");
//              print("小区的门2 ${positionEntity2.doorIds}");
//              print("小区的街道2 ${positionEntity2.positionIds}");
//            });
//          }
//        });
//      }
      print("保存$saveList");
    });

    /// 获取小区下的门
//      positionEntity.doorIds.forEach((doorId) async {
//        var url4 = '/doors/$doorId';
//        var res4 = await Http.get(path: url4);
//        DoorEntity doorEntity = DoorEntity.fromJson(res4);
//        print(doorEntity.name);
//      });
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
      initialRoute: '/',
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
