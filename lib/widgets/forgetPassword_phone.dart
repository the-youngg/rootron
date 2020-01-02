import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rootron/models/index.dart';
import 'package:rootron/routes/route.dart';
import 'package:rootron/stores/forgetPasswordStore.dart';
import 'package:rootron/utils/HttpUtils.dart';
import 'package:rootron/utils/ToastUtil.dart';

class ForgetPasswordPhone extends StatelessWidget {
  final ForgetPasswordStore forgetPasswordMobx = ForgetPasswordStore();

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
                  '手机号',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 15.0)),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    inputFormatters: [LengthLimitingTextInputFormatter(11)],
                    onChanged: (text) {
                      forgetPasswordMobx.tel = text;
                    },
                    decoration: InputDecoration(
                      hintText: '  请填写手机号',
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
                telIsExist(context);
              },
              child: Text('下一步'),
            )
          ],
        ),
      ),
    );
  }

  /// 判断手机号是否注册
  void telIsExist(BuildContext context) {
    ForgetPasswordStore forgetPasswordStore =
        Provider.of<ForgetPasswordStore>(context);
    if (forgetPasswordMobx.tel == null) {
      ToastUtil.show(context: context, msg: "请输入手机号");
      return;
    }
    var url = '/users/?tel=${forgetPasswordMobx.tel}';
    Http.get(path: url).then((users) {
      UserList userList = UserList.fromJson(users);
      if (userList.users.length == 0) {
        ToastUtil.show(context: context, msg: "手机号不存在");
        return;
      }
      forgetPasswordStore.resetPasswordUser = userList.users.first;

      ///fixme 这里是跨页面传值还是将输入的手机存入全局变量好？
      forgetPasswordStore.tel = forgetPasswordMobx.tel;
      Navigator.pushNamed(context, CommunityRoute.forgetPasswordSmsCode);
    });
  }
}
