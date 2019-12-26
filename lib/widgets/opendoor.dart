import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rootron/models/userInfo.dart';
import 'package:rootron/routes/route.dart';
import 'package:rootron/stores/userStore.dart';

class OpenDoor extends StatefulWidget {
  OpenDoor({Key key}) : super(key: key);

  @override
  _OpenDoorState createState() => _OpenDoorState();
}

class _OpenDoorState extends State<OpenDoor> {
  String positionValue;
  String doorValue;

  List<String> positions;
  List<Door> doors;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    positionValue = null;
    doorValue = null;

    positions = [];
    doors = [];
  }

  @override
  Widget build(BuildContext context) {
    UserStore userStore = Provider.of<UserStore>(context);
    positions = userStore.positionBindDoorList.keys.toList();
    if (positionValue == null) {
      doors = List();
    } else {
      doors = userStore.positionBindDoorList[positionValue];
    }
    return Scaffold(
      appBar: new AppBar(
//          backgroundColor: Colors.white,
        title: new Text(
          '开门',
          style: new TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: new Center(
        child: new Column(
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
                          child: Text(value),
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
                      items: doors.map<DropdownMenuItem<String>>((Door value) {
                        return DropdownMenuItem<String>(
                          value: value.name,
                          child: Text(value.name),
                        );
                      }).toList(),
                    ),
                  ),
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
      margin: EdgeInsets.only(top: (MediaQuery.of(context).size.height) / 4),
      width: 180.0,
      height: 180.0,
      decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
        BoxShadow(
//          color: Colors.lightBlue,
          blurRadius: 20,
          spreadRadius: 2,
        ),
      ]),
      child: RaisedButton(
          shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(90.0))),
//          color: Colors.blue,
          onPressed: _openDoor,
          padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
          child: Text(
            "OPEN",
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.w400),
          )),
    );
  }

  void _openDoor() {
    print("positionValue$positionValue");
    print("doorValue$doorValue");
    Navigator.pushNamed(context, CommunityRoute.login);
  }
}
