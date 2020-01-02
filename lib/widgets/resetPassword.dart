import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rootron/routes/route.dart';

class ResetPassword extends StatelessWidget {
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
                    onChanged: (text) {},
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        dragStartBehavior: DragStartBehavior.down,
                        onTap: () {},
                        child: Icon(
                          Icons.visibility,
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
                    onChanged: (text) {},
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        dragStartBehavior: DragStartBehavior.down,
                        onTap: () {},
                        child: Icon(
                          Icons.visibility,
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
                Navigator.pushNamed(
                    context, CommunityRoute.resetPasswordSuccess);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  CommunityRoute.resetPasswordSuccess,
                  ModalRoute.withName(CommunityRoute.login),
                );
              },
              child: Text('确定'),
            )
          ],
        ),
      ),
    );
  }
}
