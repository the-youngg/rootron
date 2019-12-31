import 'package:flutter/material.dart';
import 'package:rootron/routes/route.dart';

class ForgetPasswordPhone extends StatelessWidget {
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
                    onChanged: (text) {},
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
                Navigator.pushNamed(
                    context, CommunityRoute.forgetPasswordSmsCode);
              },
              child: Text('下一步'),
            )
          ],
        ),
      ),
    );
  }
}
