import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rootron/common/global.dart';
import 'package:rootron/models/index.dart';
import 'package:rootron/models/userInfo.dart';
import 'package:rootron/routes/route.dart';
import 'package:rootron/stores/loginStore.dart';
import 'package:rootron/stores/userStore.dart';
import 'package:rootron/utils/HttpUtils.dart';
import 'package:rootron/utils/LocalStore.dart';
import 'package:rootron/utils/ProgressDialog.dart';
import 'package:rootron/utils/ToastUtil.dart';
import 'package:rootron/widgets/app.dart';

enum DialogDemoAction {
  cancel,
  discard,
  disagree,
  agree,
}

enum otherLogin { facebook, ins, linkedin, twitter }

Dio dio = Dio();

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void showDemoDialog<T>({BuildContext context, Widget child}) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((T value) {
      // The value passed to Navigator.pop() or null.
      if (value != null) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('You selected: $value'),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    LoginStore loginStore = Provider.of<LoginStore>(context);
    return Scaffold(
      /// 防止点击输入框时页面被压缩
      resizeToAvoidBottomInset: false,
      body: Observer(
        builder: (_) => ProgressDialog(
          loading: loginStore.isLoading,
          msg: '正在登录...',
          child: SafeArea(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: 40.0, right: 40.0),
              child: Column(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 80.0),
                          child: Image.asset(
                            'assets/icons/logo.png',
                            width: 80.0, //屏幕最大宽度
                            height: 80.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Text(
                        '欢迎来到 xxx!',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        '登录后提供更优质的功能',
                        style: TextStyle(color: Colors.grey[400], fontSize: 13),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 50.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          '账    号：',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            onChanged: (text) {
//                              loginStore.setUsername(text);
                              loginStore.username = text;
                            },
                            decoration: InputDecoration(
                              hintText: '用户名/手机/邮箱',
                              hintStyle: TextStyle(
                                  fontSize: 14, color: Colors.grey[400]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          '密    码：',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            obscureText: loginStore.obscureText,
                            onChanged: (text) {
                              loginStore.password = text;
                            },
                            decoration: InputDecoration(
                              hintText: '请输入密码',
                              hintStyle: TextStyle(
                                  fontSize: 14, color: Colors.grey[400]),
                              suffixIcon: GestureDetector(
                                dragStartBehavior: DragStartBehavior.down,
                                onTap: () {
                                  loginStore.obscureText =
                                      !loginStore.obscureText;
                                },
                                child: Icon(
                                  loginStore.obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  semanticLabel: loginStore.obscureText
                                      ? 'hide password'
                                      : 'show password',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 5.0),
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          _forgetPassword();
                        },
                        child: Text(
                          '忘记密码？',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.grey[600],
                          ),
                        ),
                      )),
                  Container(
                    padding: EdgeInsets.only(top: 60.0),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      onPressed: () {
                        _login(loginStore);
                      },
                      child: Text(
                        "登录",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('新用户? '),
                        GestureDetector(
                          onTap: () {
                            _register();
                          },
                          child: Text(
                            '注册',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      padding:
                          EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Divider(
                                height: 1.0, indent: 0.0, color: Colors.grey),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("or"),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Divider(
                                height: 1.0, indent: 0.0, color: Colors.grey),
                          )
                        ],
                      )),
                  Container(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        _bottomIcon(
                            'assets/icons/facebook.png', otherLogin.facebook),
                        _bottomIcon('assets/icons/ins.png', otherLogin.ins),
                        _bottomIcon(
                            'assets/icons/linkedin.png', otherLogin.linkedin),
                        _bottomIcon(
                            'assets/icons/twitter.png', otherLogin.twitter),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomIcon(String icon, otherLogin) {
    return IconButton(
        icon: Image.asset(icon),
        onPressed: () {
          ToastUtil.show(context: context, msg: otherLogin.toString());
        });
  }

  // ignore: slash_for_doc_comments
  /**
   * 登录的方法
   */
  _login(LoginStore loginStore) async {
    loginStore.isLoading = true;
    final ThemeData theme = Theme.of(context);
    final TextStyle dialogTextStyle =
        theme.textTheme.subhead.copyWith(color: theme.textTheme.caption.color);
    const url = '/authenticate';
    var data = {
      "username": loginStore.username,
      "password": loginStore.password
    };

    Http.post(path: url, data: data).then((res) {
      var decode = json.encode(res);
      Auth auth = new Auth.fromJson(res);
      Global.token = auth.token;
      print("token: ${Global.token}");
      getUserInfo(auth.userId);
      LocalStore.setLocalStorage('auth', decode).then((isOk) {
        if (isOk) {
          Navigator.popUntil(
            context,
            ModalRoute.withName(CommunityRoute.openDoor),
          );
        }
      });
    }).catchError((Object error) {
      print('Http is catch：$error');
      showDemoDialog<DialogDemoAction>(
        context: context,
        child: AlertDialog(
          title: const Text(
            '登录失败',
            style: TextStyle(color: Colors.black),
          ),
          content: Text(
            '请输入正确的账号和密码',
            style: dialogTextStyle,
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text('确定'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      );
    }).whenComplete(() {
      print('Http is Complete');
      loginStore.isLoading = false;
    });
  }

  /// 注册的方法
  _register() {
    Navigator.pushNamed(context, CommunityRoute.bindUser);
  }

  /// 忘记密码
  _forgetPassword() {
    Navigator.pushNamed(context, CommunityRoute.forgetPasswordPhone);
  }

  ///todo 公共方法
  Future<void> getUserInfo(int userId) async {
    /// 获取用户房屋信息
    var url2 = '/houseInfos/?userId=$userId';
    await Http.get(path: url2).then((res2) {
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
      Provider.of<UserStore>(context).isLogin = true;
    }).catchError((error) {
      print("获取房屋信息异常：$error");
      ToastUtil.show(context: context, msg: "登录失败");
    });
  }
}
