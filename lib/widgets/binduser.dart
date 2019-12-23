import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rootron/routes/route.dart';
import 'package:rootron/utils/LocalStore.dart';

import 'bindhouse.dart';

class BindUser extends StatefulWidget {
  @override
  _BindUserState createState() => _BindUserState();

  const BindUser({Key key}) : super(key: key);
}

class _BindUserState extends State<BindUser> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    BorderSide _outBorderSide = BorderSide(color: Colors.grey[500], width: 0);
    return WillPopScope(
      onWillPop: () => _showMessage(context, "信息", "触发手机按键返回事件"),
      child: Scaffold(
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
                _usernameWidget(),
                _passwordWidget(),
                _phoneWidget(),
                _smsCodeWidget(),
                const SizedBox(
                  height: 10.0,
                ),
                _bindUserButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: slash_for_doc_comments
  /**
   * 账号输入框
   */
  Widget _usernameWidget() {
    return new Row(
      children: <Widget>[
        new Text(
          '用户名：',
          style: new TextStyle(
              fontSize: 16, color: Colors.teal, fontWeight: FontWeight.w500),
        ),
        new Expanded(
          child: new TextField(
            decoration: InputDecoration(
//              border: OutlineInputBorder(),
//              hintText: '请输入账号',
//              prefixIcon: Icon(Icons.person),
              hintText: '请输入用户名',
              hintStyle: new TextStyle(fontSize: 14, color: Colors.grey[400]),
            ),
          ),
        ),
      ],
    );
  }

  // ignore: slash_for_doc_comments
  /**
   * 密码输入框
   */
  Widget _passwordWidget() {
    return new Row(
      children: <Widget>[
        new Text(
          '密    码：',
          style: new TextStyle(
              fontSize: 16, color: Colors.teal, fontWeight: FontWeight.w500),
        ),
        new Expanded(
          child: new TextField(
            obscureText: _obscureText,
            decoration: InputDecoration(
//              border: OutlineInputBorder(),
              hintText: '请输入密码',
              hintStyle: new TextStyle(fontSize: 14, color: Colors.grey[400]),
              suffixIcon: GestureDetector(
                dragStartBehavior: DragStartBehavior.down,
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  semanticLabel:
                      _obscureText ? 'show password' : 'hide password',
                ),
              ),
//              labelText: '',
//              prefixIcon: Icon(Icons.person),
            ),
          ),
        ),
      ],
    );
  }

  // ignore: slash_for_doc_comments
  /**
   * 手机输入框
   */
  Widget _phoneWidget() {
    return new Row(
      children: <Widget>[
        new Text(
          '手    机：',
          style: new TextStyle(
              fontSize: 16, color: Colors.teal, fontWeight: FontWeight.w500),
        ),
        new Expanded(
          child: new TextField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
//              border: OutlineInputBorder(),
              hintText: '请输入手机号',
              hintStyle: new TextStyle(fontSize: 14, color: Colors.grey[400]),
//              labelText: '',
//              prefixIcon: Icon(Icons.person),
            ),
          ),
        ),
        new SizedBox(
          width: 120.0,
          child: RaisedButton(
            onPressed: () {
              _sendSMSCode(context);
            },
            child: new Text(
              '发送验证码',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  // ignore: slash_for_doc_comments
  /**
   * 验证码输入框
   */
  Widget _smsCodeWidget() {
    return new Row(
      children: <Widget>[
        new Text(
          '验证码：',
          style: new TextStyle(
              fontSize: 16, color: Colors.teal, fontWeight: FontWeight.w500),
        ),
        new Expanded(
          child: new TextField(
            maxLength: 6,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
//              border: OutlineInputBorder(),
              hintText: '请输入验证码',
              hintStyle: new TextStyle(fontSize: 14, color: Colors.grey[400]),
//              labelText: '',
//              prefixIcon: Icon(Icons.person),
            ),
          ),
        ),
      ],
    );
  }

  // ignore: slash_for_doc_comments
  /**
   * 绑定用户按钮
   */
  Widget _bindUserButton(BuildContext context) {
    return new RaisedButton(
      onPressed: () {
        _bindUser(context);
      },
      child: Text(
        "绑定",
        style: new TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  // ignore: slash_for_doc_comments
  /**
   * 发送验证码的方法
   */
  _sendSMSCode(BuildContext context) {}

  // ignore: slash_for_doc_comments
  /**
   * 绑定账号的方法
   */
  _bindUser(BuildContext context) {
    Navigator.pushNamed(context, CommunityRoute.bindHouse);
  }

  /// 展示模态框信息
  Future<void> _showMessage(
      BuildContext context, String title, String message) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
