import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rootron/common/global.dart';

class Method {
  static final String get = "GET";
  static final String post = "POST";
  static final String put = "PUT";
  static final String head = "HEAD";
  static final String delete = "DELETE";
  static final String patch = "PATCH";
}

class HttpUtils {
  static final HttpUtils _instance = HttpUtils._init();
  static Dio _dio;
  static BaseOptions _options = getDefOptions();

  factory HttpUtils() {
    return _instance;
  }

  HttpUtils._init() {
    _dio = new Dio();
  }

  static BaseOptions getDefOptions() {
    BaseOptions options = BaseOptions();
    options.connectTimeout = 5 * 1000;
    options.receiveTimeout = 10 * 1000;

    Map<String, dynamic> headers = Map<String, dynamic>();
    headers['Accept'] = 'application/json';

    String platform;
    if (Platform.isAndroid) {
      platform = "Android";
    } else if (Platform.isIOS) {
      platform = "IOS";
    }
    headers['OS'] = platform;
    options.headers = headers;

    return options;
  }

  setOptions(BaseOptions options) {
    _options = options;
    _dio.options = _options;
  }

  /// get请求
  static Future<Map<String, dynamic>> get(String path,
      {pathParams, data, Function errorCallback}) {
    return request(path,
        method: Method.get,
        pathParams: pathParams,
        data: data,
        errorCallback: errorCallback);
  }

  /// post请求
  static Future<Map<String, dynamic>> post(String path,
      {pathParams, data, Function errorCallback}) {
    return request(path,
        method: Method.post,
        pathParams: pathParams,
        data: data,
        errorCallback: errorCallback);
  }

  /// 开始执行
  static Future<Map<String, dynamic>> request(String path,
      {String method, Map pathParams, data, Function errorCallback}) async {
    ///restful请求处理
    if (pathParams != null) {
      pathParams.forEach((key, value) {
        if (path.indexOf(key) != -1) {
          path = path.replaceAll(":$key", value.toString());
        }
      });
    }
    Dio dio = Dio();
    Response response =
        await dio.request(path, data: data, options: Options(method: method));

    if (response.statusCode == HttpStatus.ok ||
        response.statusCode == HttpStatus.created) {
      try {
        if (response.data is Map) {
          return response.data;
        } else {
          return json.decode(response.data.toString());
        }
      } catch (e) {
        return null;
      }
    } else {
      _handleHttpError(response.statusCode);
      if (errorCallback != null) {
        errorCallback(response.statusCode);
      }
      return null;
    }
  }

  ///处理Http错误码
  static void _handleHttpError(int errorCode) {}
}

class Http {
  static BaseOptions options = BaseOptions(
    // 请求基地址,可以包含子路径，如: "https://www.google.com/api/".
    baseUrl: Global.rootronURL,
    //连接服务器超时时间，单位是毫秒.
    connectTimeout: 5000,

    ///  响应流上前后两次接受到数据的间隔，单位为毫秒。如果两次间隔超过[receiveTimeout]，
    ///  [Dio] 将会抛出一个[DioErrorType.RECEIVE_TIMEOUT]的异常.
    ///  注意: 这并不是接收数据的总时限.
    receiveTimeout: 3000,
//    responseType: ResponseType.plain,
//    contentType: "application/json",
    headers: {HttpHeaders.authorizationHeader: Global.token},
  );

  static Dio dio = Dio(options);

  static Future get({
    @required String path,
    Map<String, dynamic> pathParams = const {},
    options,
    cancelToken,
  }) async {
    print('get请求启动! url：$path ,body: $pathParams');
    Response response;

    try {
      print(path);
      response = await dio.get(
        path,
        queryParameters: pathParams,
        cancelToken: cancelToken,
      );
      print('get请求完成!response.data：${response.data}');
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('get请求取消! ' + e.message);
      }
      print('get请求发生错误：$e');
    }
    return response.data;
  }

  static Future post({
    @required String path,
    Map<String, dynamic> data = const {},
    options,
    cancelToken,
  }) async {
    print('post请求启动! url：$path ,body: $data');
    Response response;

    try {
      response = await dio.post(
        path,
        data: data,
        cancelToken: cancelToken,
      );
      print('post请求成功!response.data：${response.data}');
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('post请求取消! ' + e.message);
      }
      print('post请求发生错误：$e');
    }
    return response.data;
  }
}
