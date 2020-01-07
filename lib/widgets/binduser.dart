import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rootron/common/global.dart';
import 'package:rootron/models/index.dart';
import 'package:rootron/routes/route.dart';
import 'package:rootron/services/login_service.dart';
import 'package:rootron/services/user_service.dart';
import 'package:rootron/stores/registerStore.dart';
import 'package:rootron/stores/userStore.dart';
import 'package:rootron/utils/HttpUtils.dart';
import 'package:rootron/utils/ToastUtil.dart';

class BindUser extends StatefulWidget {
  @override
  _BindUserState createState() => _BindUserState();

  const BindUser({Key key}) : super(key: key);
}

class _BindUserState extends State<BindUser> {
  final RegisterStore registerMobx = new RegisterStore();
  Timer timer; //倒计时的计时器
  TextEditingController mController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    BorderSide _outBorderSide = BorderSide(color: Colors.grey[500], width: 0);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: new AppBar(
        title: new Text(
          '绑定账号',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: new Padding(
        padding: EdgeInsets.only(top: 60.0),
        child: new Container(
          height: 400.0,
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: Colors.white10,
            border: Border(
              left: _outBorderSide,
              right: _outBorderSide,
              top: _outBorderSide,
              bottom: _outBorderSide,
            ),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                children: <Widget>[
                  new Text(
                    '用户名：',
                    style: new TextStyle(
                        fontSize: 16,
                        color: Colors.teal,
                        fontWeight: FontWeight.w500),
                  ),
                  new Expanded(
                    child: TextField(
                      onChanged: (text) {
                        registerMobx.username = text;
                      },
                      decoration: InputDecoration(
                        hintText: '请输入用户名',
                        hintStyle: new TextStyle(
                            fontSize: 14, color: Colors.grey[400]),
                      ),
                    ),
                  ),
                ],
              ),
              Observer(
                builder: (_) => Row(
                  children: <Widget>[
                    new Text(
                      '密    码：',
                      style: new TextStyle(
                          fontSize: 16,
                          color: Colors.teal,
                          fontWeight: FontWeight.w500),
                    ),
                    Expanded(
                      child: TextField(
                        obscureText: registerMobx.isObscureText,
                        onChanged: (text) {
                          registerMobx.password = text;
                        },
                        decoration: InputDecoration(
                          hintText: '请输入密码',
                          hintStyle: new TextStyle(
                              fontSize: 14, color: Colors.grey[400]),
                          suffixIcon: GestureDetector(
                            dragStartBehavior: DragStartBehavior.down,
                            onTap: () {
                              registerMobx.isObscureText =
                                  !registerMobx.isObscureText;
                            },
                            child: Icon(
                              registerMobx.isObscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              semanticLabel: registerMobx.isObscureText
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
              Row(
                children: <Widget>[
                  new Text(
                    '手    机：',
                    style: new TextStyle(
                        fontSize: 16,
                        color: Colors.teal,
                        fontWeight: FontWeight.w500),
                  ),
                  new Expanded(
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      onChanged: (text) {
                        registerMobx.tel = text;
                      },
                      decoration: InputDecoration(
                        hintText: '请输入手机号',
                        hintStyle: new TextStyle(
                            fontSize: 14, color: Colors.grey[400]),
                      ),
                    ),
                  ),
                  Observer(
                    builder: (_) => SizedBox(
                      height: 40,
                      width: 124.0,
                      child: FlatButton(
                        disabledColor: Colors.grey.withOpacity(0.1),
                        //按钮禁用时的颜色
                        disabledTextColor: Colors.white,
                        //按钮禁用时的文本颜色
                        textColor: registerMobx.isSmsButtonEnable
                            ? Colors.white
                            : Colors.black.withOpacity(0.2),
                        //文本颜色
                        color: registerMobx.isSmsButtonEnable
                            ? Color(0xff44c5fe)
                            : Colors.grey.withOpacity(0.1),
                        //按钮的颜色
                        splashColor: registerMobx.isSmsButtonEnable
                            ? Colors.white.withOpacity(0.1)
                            : Colors.transparent,
                        shape: StadiumBorder(side: BorderSide.none),
                        onPressed: () {
                          _sendSMSCode();
                        },
                        child: Text(
                          '${registerMobx.smsCodeButtonText}',
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  new Text(
                    '验证码：',
                    style: new TextStyle(
                        fontSize: 16,
                        color: Colors.teal,
                        fontWeight: FontWeight.w500),
                  ),
                  new Expanded(
                    child: TextField(
                      maxLength: 6,
                      keyboardType: TextInputType.number,
                      onChanged: (text) {
                        registerMobx.smsCode = text;
                      },
                      decoration: InputDecoration(
                        hintText: '请输入验证码',
                        hintStyle: new TextStyle(
                            fontSize: 14, color: Colors.grey[400]),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                onPressed: () {
                  _bindUser(context);
                },
                child: Text(
                  "绑定",
                  style:
                      new TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 发送验证码的方法
  Future<void> _sendSMSCode() async {
    UserService.getUserByTel(registerMobx.tel).then((userList) {
      if (userList.users.length == 0) {
        ToastUtil.show(context: context, msg: "该手机号不存在");
        return;
      }
      if (registerMobx.isSmsButtonEnable) {
        ToastUtil.show(context: context, msg: "短信已发送, 默认：123456");
        registerMobx.isSmsButtonEnable = false;
        _initTimer();

        return;
      } else {
        return;
      }
    });
  }

  void _initTimer() {
    timer = new Timer.periodic(Duration(seconds: 1), (Timer timer) {
      registerMobx.count--;
      if (registerMobx.count == 0) {
        timer.cancel();
        registerMobx.isSmsButtonEnable = true;
        registerMobx.count = 60;
        registerMobx.smsCodeButtonText = '发送验证码';
      } else {
        registerMobx.smsCodeButtonText = '重新发送(${registerMobx.count})';
      }
    });
  }

  // ignore: slash_for_doc_comments
  /**
   * 绑定账号的方法
   */
  _bindUser(BuildContext context) async {
    if (registerMobx.smsCode != '123456') {
      ToastUtil.show(context: context, msg: "验证码错误或者已经过期，请重新发送");
      return;
    }

    UserService.getUserByTel(registerMobx.tel).then((userList) {
      if (userList.users.length == 0) {
        ToastUtil.show(context: context, msg: "该手机号不存在");
        return;
      }
      User user = userList.users.first;
      UserService.updateUserInfoByUserId(
        user.id,
        registerMobx.username,
        registerMobx.password,
      ).then((res) {
        LoginService.login(
          registerMobx.username,
          registerMobx.password,
        ).then((auth) {
          Global.token = auth.token;
          print("token: ${Global.token}");

          UserService.getUserByUserId(user.id).then((user) {
            final userStore = Provider.of<UserStore>(context);
            userStore.currentUser = user;
            print(user.password);
            Navigator.pushNamed(context, CommunityRoute.bindHouse);
          });
        });
      }).catchError((error) {
        ToastUtil.show(context: context, msg: "绑定失败");
      });
    });
  }
}
