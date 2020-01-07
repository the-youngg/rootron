import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:rootron/models/positions.dart';
import 'package:rootron/routes/route.dart';
import 'package:rootron/stores/userStore.dart';
import 'package:rootron/utils/HttpUtils.dart';

class BindHouse extends StatefulWidget {
  @override
  _BindHouseState createState() => _BindHouseState();

  const BindHouse({Key key}) : super(key: key);
}

class _BindHouseState extends State<BindHouse> {
  @override
  void initState() {
    super.initState();
    Future(() {
      final userStore = Provider.of<UserStore>(context);
      userStore.getHouseInfoList(userStore.currentUser.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context);
    BorderSide _outBorderSide = BorderSide(color: Colors.grey[500], width: 0);
    return Observer(builder: (_) {
      List<HouseInfo> houseInfoData = userStore.houseInfoList?.houseInfoList;
      return Scaffold(
        appBar: AppBar(
          title: Text(
            '绑定房屋',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: houseInfoData == null
            ? Stack(
                children: <Widget>[
                  new Padding(
                    padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 35.0),
                    child: new Center(
                      child: SpinKitFadingCircle(
                        color: Colors.blueAccent,
                        size: 30.0,
                      ),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 0.0),
                    child: new Center(
                      child: new Text('正在加载中...'),
                    ),
                  ),
                ],
              )
            : Padding(
                padding: EdgeInsets.only(top: 1.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 300.0,
                      padding: EdgeInsets.all(8.0),
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
                      child: Scrollbar(
                        child: ListView.builder(
                          itemCount: houseInfoData.length,
                          itemBuilder: (BuildContext context, int index) {
                            var item = houseInfoData[index];

                            return CheckboxListTile(
                              secondary: const Icon(Icons.home),
                              title: Text(item.positionId.toString()),
                              value: item.isBind ?? false,
                              onChanged: (bool value) {
                                setState(() {
                                  item.isBind = value;
                                });
                                print(item.isBind);
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      margin: EdgeInsets.only(left: 24.0, right: 24.0),
                      child: Column(
                        children: <Widget>[
                          RaisedButton(
                            onPressed: () {
                              userStore.houseInfoList.houseInfoList
                                  .forEach((house) {
                                if (house.isBind) {
                                  print(house.isBind);
                                  var url = '/houseInfos/${house.id}';
                                  var data = {"isBind": true};
                                  Http.patch(path: url, data: data).then((res) {
                                    Navigator.popUntil(
                                      context,
                                      ModalRoute.withName(
                                          CommunityRoute.openDoor),
                                    );
                                  });
                                }
                              });
                            },
                            child: Text(
                              "绑定",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
//                    _logoutButton(context),
                        ],
                      ),
                    )
                  ],
                )),
      );
    });
  }
}
