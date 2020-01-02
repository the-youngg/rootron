import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rootron/common/global.dart';
import 'package:rootron/routes/route.dart';
import 'package:rootron/stores/forgetPasswordStore.dart';
import 'package:rootron/stores/userStore.dart';
import 'package:rootron/utils/HttpUtils.dart';
import 'package:rootron/utils/LocalStore.dart';
import 'package:rootron/utils/ToastUtil.dart';

class ResetPassword extends StatelessWidget {
  final ForgetPasswordStore forgetPasswordMobx = ForgetPasswordStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('找回密码'),
      ),
      body: Observer(
        builder: (_) => Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 75,
                    child: Text(
                      '新密码',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 15.0)),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      obscureText: forgetPasswordMobx.isObscureText,
                      onChanged: (text) {
                        forgetPasswordMobx.newPassword = text;
                      },
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          dragStartBehavior: DragStartBehavior.down,
                          onTap: () {
                            forgetPasswordMobx.isObscureText =
                                !forgetPasswordMobx.isObscureText;
                          },
                          child: Icon(
                            forgetPasswordMobx.isObscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            semanticLabel: forgetPasswordMobx.isObscureText
                                ? 'hide password'
                                : 'show password',
                          ),
                        ),
                        hintText: '请输入新密码',
                        hintStyle:
                            TextStyle(fontSize: 16, color: Colors.grey[400]),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 75,
                    child: Text(
                      '确认密码',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 15.0)),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      obscureText: forgetPasswordMobx.isObscureText,
                      onChanged: (text) {
                        forgetPasswordMobx.confirmPassword = text;
                      },
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          dragStartBehavior: DragStartBehavior.down,
                          onTap: () {
                            forgetPasswordMobx.isObscureText =
                                !forgetPasswordMobx.isObscureText;
                          },
                          child: Icon(
                            forgetPasswordMobx.isObscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            semanticLabel: forgetPasswordMobx.isObscureText
                                ? 'hide password'
                                : 'show password',
                          ),
                        ),
                        hintText: '请再次输入新密码',
                        hintStyle:
                            TextStyle(fontSize: 16, color: Colors.grey[400]),
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
                  resetPassword(context);
                },
                child: Text('确定'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void resetPassword(BuildContext context) {
    if (forgetPasswordMobx.newPassword == null) {
      ToastUtil.show(context: context, msg: "新密码不能为空");
      return;
    }
    if (forgetPasswordMobx.confirmPassword == null) {
      ToastUtil.show(context: context, msg: "确认密码不能为空");
      return;
    }
    if (forgetPasswordMobx.newPassword != forgetPasswordMobx.confirmPassword) {
      ToastUtil.show(context: context, msg: "两次密码不一致");
      return;
    }

    ForgetPasswordStore forgetPasswordStore =
        Provider.of<ForgetPasswordStore>(context);
    var url = '/users/${forgetPasswordStore.resetPasswordUser.id}';
    var data = {"password": forgetPasswordMobx.confirmPassword};
    Http.patch(path: url, data: data).then((res) {
      _logOut(context);
      Navigator.pushNamedAndRemoveUntil(
        context,
        CommunityRoute.resetPasswordSuccess,
        ModalRoute.withName(CommunityRoute.login),
      );
    }).catchError((error) {
      ToastUtil.show(context: context, msg: "修改密码失败");
      print("修改密码失败$error");
    });
  }

  /// 退出登录
  void _logOut(BuildContext context) {
    LocalStore.removeLocalStorage('auth');
    Provider.of<UserStore>(context).isLogin = false;
    Provider.of<UserStore>(context).positionBindDoorList = {};
    Global.token = "";
  }
}
