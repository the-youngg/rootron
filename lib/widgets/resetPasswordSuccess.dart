import 'package:flutter/material.dart';
import 'package:rootron/routes/route.dart';

class ResetPasswordSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('找回密码'),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 60.0),
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/icons/gou.png',
              width: 120.0, //屏幕最大宽度
              height: 120.0,
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              '恭喜您，密码设置成功',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 60.0,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, CommunityRoute.login);
              },
              child: Text('立即登陆'),
            )
          ],
        ),
      ),
    );
  }
}
