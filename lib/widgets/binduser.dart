import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rootron/models/index.dart';
import 'package:rootron/routes/route.dart';
import 'package:rootron/stores/registerStore.dart';
import 'package:rootron/utils/HttpUtils.dart';
import 'package:rootron/utils/ToastUtil.dart';

class BindUser extends StatefulWidget {
  @override
  _BindUserState createState() => _BindUserState();

  const BindUser({Key key}) : super(key: key);
}

class _BindUserState extends State<BindUser> {
  final RegisterStore registerStore = new RegisterStore();
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
                    child: Observer(
                      builder: (_) => TextField(
                        onChanged: (text) {
                          registerStore.username = text;
                        },
                        decoration: InputDecoration(
                          hintText: '请输入用户名',
                          hintStyle: new TextStyle(
                              fontSize: 14, color: Colors.grey[400]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  new Text(
                    '密    码：',
                    style: new TextStyle(
                        fontSize: 16,
                        color: Colors.teal,
                        fontWeight: FontWeight.w500),
                  ),
                  Observer(
                    builder: (_) => Expanded(
                      child: Observer(
                        builder: (_) => TextField(
                          obscureText: registerStore.isObscureText,
                          onChanged: (text) {
                            registerStore.password = text;
                          },
                          decoration: InputDecoration(
                            hintText: '请输入密码',
                            hintStyle: new TextStyle(
                                fontSize: 14, color: Colors.grey[400]),
                            suffixIcon: GestureDetector(
                              dragStartBehavior: DragStartBehavior.down,
                              onTap: () {
                                registerStore.isObscureText =
                                    !registerStore.isObscureText;
                              },
                              child: Icon(
                                registerStore.isObscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                semanticLabel: registerStore.isObscureText
                                    ? 'hide password'
                                    : 'show password',
                              ),
                            ),
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
                    '手    机：',
                    style: new TextStyle(
                        fontSize: 16,
                        color: Colors.teal,
                        fontWeight: FontWeight.w500),
                  ),
                  new Expanded(
                    child: Observer(
                      builder: (_) => TextField(
                        keyboardType: TextInputType.phone,
                        onChanged: (text) {
                          registerStore.tel = text;
                        },
                        decoration: InputDecoration(
                          hintText: '请输入手机号',
                          hintStyle: new TextStyle(
                              fontSize: 14, color: Colors.grey[400]),
                        ),
                      ),
                    ),
                  ),
                  Observer(
                    builder: (_) => Container(
                      width: 120,
                      child: FlatButton(
                        disabledColor: Colors.grey.withOpacity(0.1),
                        //按钮禁用时的颜色
                        disabledTextColor: Colors.white,
                        //按钮禁用时的文本颜色
                        textColor: registerStore.isSmsButtonEnable
                            ? Colors.white
                            : Colors.black.withOpacity(0.2),
                        //文本颜色
                        color: registerStore.isSmsButtonEnable
                            ? Color(0xff44c5fe)
                            : Colors.grey.withOpacity(0.1),
                        //按钮的颜色
                        splashColor: registerStore.isSmsButtonEnable
                            ? Colors.white.withOpacity(0.1)
                            : Colors.transparent,
                        shape: StadiumBorder(side: BorderSide.none),
                        onPressed: () {
                          _sendSMSCode();
                        },
                        child: Text(
                          '${registerStore.smsCodeButtonText}',
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
                    child: Observer(
                      builder: (_) => TextField(
                        maxLength: 6,
                        keyboardType: TextInputType.number,
                        onChanged: (text) {
                          registerStore.smsCode = text;
                        },
                        decoration: InputDecoration(
                          hintText: '请输入验证码',
                          hintStyle: new TextStyle(
                              fontSize: 14, color: Colors.grey[400]),
                        ),
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

  // ignore: slash_for_doc_comments
  /**
   * 发送验证码的方法
   */

  void _sendSMSCode() {
    if (registerStore.isSmsButtonEnable) {
      ToastUtil.show(context: context, msg: "短信已发送, 默认：123456");
      registerStore.isSmsButtonEnable = false;
      _initTimer();

      return;
    } else {
      return;
    }
  }

  void _initTimer() {
    timer = new Timer.periodic(Duration(seconds: 1), (Timer timer) {
      registerStore.count--;
      if (registerStore.count == 0) {
        timer.cancel();
        registerStore.isSmsButtonEnable = true;
        registerStore.count = 60;
        registerStore.smsCodeButtonText = '发送验证码';
      } else {
        registerStore.smsCodeButtonText = '重新发送(${registerStore.count})';
      }
    });
  }

  // ignore: slash_for_doc_comments
  /**
   * 绑定账号的方法
   */
  _bindUser(BuildContext context) async {
    debugPrint(registerStore.username);
    debugPrint(registerStore.password);
    debugPrint(registerStore.tel);
    debugPrint(registerStore.smsCode);

    /// todo 1. 先验证短信验证码 2. 验证手机号是否注册过

    if (registerStore.smsCode != '123456') {
      ToastUtil.show(context: context, msg: "验证码错误或者已经过期，请重新发送");
      return;
    }

    var url1 = '/users/?tel=${registerStore.tel}';
    var users = await Http.get(path: url1);
    UserList userList = UserList.fromJson(users);
    if (userList.users.length != 0) {
      ToastUtil.show(context: context, msg: "该手机号已经注册。");
      return;
    }

    const url2 = '/users';
    var data = {
      "username": registerStore.username,
      "password": registerStore.password,
      "tel": registerStore.tel,
    };
    await Http.post(path: url2, data: data).then((res) {
      ToastUtil.show(context: context, msg: "绑定成功");
      Future.delayed(Duration(milliseconds: 500));
      Navigator.pushNamed(context, CommunityRoute.bindHouse);
    }).catchError((error) {
      ToastUtil.show(context: context, msg: "绑定失败");
    });
  }
}
