import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rootron/common/global.dart';
import 'package:rootron/models/positions.dart';
import 'package:rootron/routes/route.dart';
import 'package:rootron/services/user_service.dart';
import 'package:rootron/stores/userStore.dart';
import 'package:rootron/utils/HttpUtils.dart';
import 'package:rootron/utils/LocalStore.dart';
import 'package:rootron/utils/ToastUtil.dart';
import 'package:rootron/widgets/openSuccess.dart';

enum OpenStatus { close, opening, opened, failure }

class OpenDoor extends StatefulWidget {
  OpenDoor({Key key}) : super(key: key);

  @override
  _OpenDoorState createState() => _OpenDoorState();
}

class _OpenDoorState extends State<OpenDoor> {
  //todo 用mobx
  String positionValue;
  String doorValue;

  List<String> positions;
  List<Device> devices;

  OpenStatus openStatus = OpenStatus.close;

  int last = 0;

  @override
  Widget build(BuildContext context) {
    UserStore userStore = Provider.of<UserStore>(context);
    positions = userStore.positionBindDeviceList.keys.toList();
    if (positionValue == null) {
      devices = List();
    } else {
      devices = userStore.positionBindDeviceList[positionValue];
    }
    return WillPopScope(
      onWillPop: _doubleClickBack,
      child: Scaffold(
        appBar: new AppBar(
//          backgroundColor: Colors.white,
          title: new Text(
            '开门',
            style: new TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            _openDoorButton(context),
            Padding(
              padding: EdgeInsets.only(
                  left: 50.0, top: 30.0, right: 50.0, bottom: 20.0),
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: new Text(
                      '选择小区：',
                    ),
                    trailing: DropdownButton<String>(
                      value: positionValue,
                      hint: const Text('请选择'),
                      onChanged: (String newValue) {
                        if (doorValue != null) {
                          setState(() {
                            doorValue = null;
                          });
                        }
                        setState(() {
                          positionValue = newValue;
                        });
                      },
                      items: positions
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: SizedBox(
                            width: 100.0,
                            child: Text(value),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  ListTile(
                    title: new Text(
                      '选择大门：',
                    ),
                    trailing: DropdownButton<String>(
                      value: doorValue,
                      hint: const Text('请选择'),
                      onChanged: (String newValue) {
                        setState(() {
                          doorValue = newValue;
                        });
                      },
                      items:
                          devices.map<DropdownMenuItem<String>>((Device value) {
                        return DropdownMenuItem<String>(
                          value: value.id.toString(),
                          child: SizedBox(
                            width: 100.0,
                            child: Text(value.name),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Observer(
                      builder: (_) => userStore.isLogin
                          ? Column(
                              children: <Widget>[
                                RaisedButton(
                                  color: Colors.green,
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, CommunityRoute.bindHouse);
                                  },
                                  child: Text(
                                    '绑定房屋',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                RaisedButton(
                                  color: Colors.green,
                                  onPressed: () {
                                    _logOut();
                                  },
                                  child: Text(
                                    '退出登录',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            )
                          : Text("")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: slash_for_doc_comments
  /**
   * 开门按钮样式
   */
  Widget _openDoorButton(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(top: (MediaQuery.of(context).size.height) / 5),
      width: 180.0,
      height: 180.0,
      decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
        BoxShadow(
          color: Colors.lightBlue,
          blurRadius: 20,
          spreadRadius: 2,
        ),
      ]),
      child: RaisedButton(
          shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(90.0))),
          color: _doorButtonColor(),
          onPressed: _openDoor,
          padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
          child: Text(
            "OPEN",
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.w400),
          )),
    );
  }

  /// 开门按钮的颜色
  Color _doorButtonColor() {
    var color;
    switch (openStatus) {
      case OpenStatus.close:
        color = Colors.green;
        break;
      case OpenStatus.opening:
        color = Colors.yellow;
        break;
      case OpenStatus.opened:
        color = Colors.blue;
        break;
      case OpenStatus.failure:
        color = Colors.red;
        break;
    }
    return color;
  }

  /// 开门的方法
  Future<void> _openDoor() async {
    setState(() {
      openStatus = OpenStatus.close;
    });

    /// 验证
    var isLogin = Provider.of<UserStore>(context).isLogin;
    if (!isLogin) {
      Navigator.pushNamed(context, CommunityRoute.login);
      return;
    }
    if (positionValue == null) {
      ToastUtil.show(context: context, msg: "请选择小区");
      return;
    }
    if (doorValue == null) {
      ToastUtil.show(context: context, msg: "请选择大门");
      return;
    }

    /// 开始开门
    ToastUtil.show(context: context, msg: "开门中...");
    setState(() {
      openStatus = OpenStatus.opening;
    });
    // 模拟等待
    await Future.delayed(Duration(seconds: 2));
    UserService.openDoor(
      "一键开门",
      doorValue,
      Provider.of<UserStore>(context).currentUser.id,
      DateTime.now().toString(),
      DateTime.now().toString(),
    ).then((res) {
      ToastUtil.show(context: context, msg: "开门成功");
      setState(() {
        openStatus = OpenStatus.opened;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return OpenSuccess(
          /// 传给下个页面的参数
          positionValue: positionValue,
          doorValue: doorValue,
        );
      }));
    }).catchError((onError) {
      ToastUtil.show(context: context, msg: "开门失败");
      setState(() {
        openStatus = OpenStatus.failure;
      });
    }).whenComplete(() async {
      await await Future.delayed(Duration(seconds: 2));
      setState(() {
        openStatus = OpenStatus.close;
      });
    });

    print("positionName: $positionValue");
    print("doorId: $doorValue");
    print("isLogin: $isLogin");
  }

  /// 退出登录
  void _logOut() {
    LocalStore.removeLocalStorage('auth');
    Provider.of<UserStore>(context).isLogin = false;
    setState(() {
      doorValue = null;
      positionValue = null;
    });
    Provider.of<UserStore>(context).positionBindDeviceList = {};
    Provider.of<UserStore>(context).houseInfoList = null;
    Global.token = "";
    Navigator.pushNamed(context, CommunityRoute.login);
  }

  /// 双击返回键退出应用
  Future<bool> _doubleClickBack() {
    int when = 2000;
    print('触发双击退出事件' + DateTime.now().toString());
    //计算两次时间间隔
    int now = DateTime.now().millisecondsSinceEpoch;
    if (now - last >= when) {
      last = DateTime.now().millisecondsSinceEpoch;
      ToastUtil.show(
          context: context, msg: '再次点击返回键退出应用', timeInSecForIos: when ~/ 1000);
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
