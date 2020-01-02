import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rootron/routes/route.dart';
import 'package:rootron/stores/forgetPasswordStore.dart';
import 'package:rootron/utils/ToastUtil.dart';

class ForgetPasswordSmsCode extends StatefulWidget {
  @override
  _ForgetPasswordCodeState createState() => _ForgetPasswordCodeState();
}

class _ForgetPasswordCodeState extends State<ForgetPasswordSmsCode> {
  final ForgetPasswordStore forgetPasswordMobx = ForgetPasswordStore();
  Timer timer; //倒计时的计时器
  TextEditingController mController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('找回密码'),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  '验证码',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 15.0)),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [LengthLimitingTextInputFormatter(6)],
                    onChanged: (text) {
                      forgetPasswordMobx.smsCode = text;
                    },
                    decoration: InputDecoration(
                      hintText: '  请输入验证码',
                      hintStyle:
                          new TextStyle(fontSize: 16, color: Colors.grey[400]),
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
                      textColor: forgetPasswordMobx.isSmsButtonEnable
                          ? Colors.white
                          : Colors.black.withOpacity(0.2),
                      //文本颜色
                      color: forgetPasswordMobx.isSmsButtonEnable
                          ? Color(0xff44c5fe)
                          : Colors.grey.withOpacity(0.1),
                      //按钮的颜色
                      splashColor: forgetPasswordMobx.isSmsButtonEnable
                          ? Colors.white.withOpacity(0.1)
                          : Colors.transparent,
                      onPressed: () {
                        _sendSMSCode(context);
                      },
                      child: Text(
                        '${forgetPasswordMobx.smsCodeButtonText}',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            RaisedButton(
              onPressed: () {
                smsCodeNext();
              },
              child: Text('下一步'),
            )
          ],
        ),
      ),
    );
  }

  /// 发送验证码的方法
  void _sendSMSCode(BuildContext context) {
    if (forgetPasswordMobx.isSmsButtonEnable) {
      ToastUtil.show(context: context, msg: "短信已发送, 默认：123456");
      forgetPasswordMobx.isSmsButtonEnable = false;
      _initTimer();

      return;
    } else {
      return;
    }
  }

  /// 点击发送验证码后
  void _initTimer() {
    timer = new Timer.periodic(Duration(seconds: 1), (Timer timer) {
      forgetPasswordMobx.count--;
      if (forgetPasswordMobx.count == 0) {
        timer.cancel();
        forgetPasswordMobx.isSmsButtonEnable = true;
        forgetPasswordMobx.count = 60;
        forgetPasswordMobx.smsCodeButtonText = '发送验证码';
      } else {
        forgetPasswordMobx.smsCodeButtonText =
            '重新发送(${forgetPasswordMobx.count})';
      }
    });
  }

  /// 下一步
  void smsCodeNext() {
    if (forgetPasswordMobx.smsCode != "123456") {
      ToastUtil.show(context: context, msg: "验证码错误或者已经过期，请重新发送");
      return;
    }
    Navigator.pushNamed(context, CommunityRoute.resetPassword);
  }
}
