import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rootron/routes/route.dart';
import 'package:rootron/stores/registerStore.dart';

class ForgetPasswordSmsCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RegisterStore registerStore = Provider.of<RegisterStore>(context);
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
                    onChanged: (text) {},
                    decoration: InputDecoration(
                      hintText: '  请输入验证码',
                      hintStyle:
                          new TextStyle(fontSize: 16, color: Colors.grey[400]),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 124.0,
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
                    onPressed: () {},
                    child: Text(
                      '${registerStore.smsCodeButtonText}',
                      style: TextStyle(
                        fontSize: 13,
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
                Navigator.pushNamed(context, CommunityRoute.resetPassword);
              },
              child: Text('下一步'),
            )
          ],
        ),
      ),
    );
  }
}
