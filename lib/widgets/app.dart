import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rootron/common/global.dart';
import 'package:rootron/models/index.dart';
import 'package:rootron/routes/route.dart';
import 'package:rootron/stores/loginStore.dart';
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
      print("token: ${auth.userId}");
      print("token: ${auth.token}");
      if (auth.token == null) {
        return;
      }
      Global.token = "Bearer " + auth.token;

      ///todo 判断token是否过期
      Provider.of<LoginStore>(context).isLogin = true;
    }).catchError((error) {
      print('获取数据失败$error');
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
