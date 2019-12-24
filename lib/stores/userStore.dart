import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:rootron/utils/HttpUtils.dart';

part 'userStore.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {

  @action
  Future getHouseInfos() async {

//    const url = "http://192.168.50.104:8181";
//    String token = "Bearer " + _token;
//    Dio dio = Dio(options);
//    dio.options.headers[HttpHeaders.authorizationHeader] = token;
//    await dio.get('/userInfo').then((res) {
//      print(res.data);
//    }).catchError((error) {
//      print('错误：$error');
//    });
  }

}
