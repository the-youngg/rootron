import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rootron/routes/route.dart';
import 'package:rootron/stores/loginStore.dart';

class OpenDoor extends StatelessWidget {
  OpenDoor({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            SelectDropDown(),
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
    LoginStore loginStore = Provider.of<LoginStore>(context);
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
          onPressed: () {
            print("准备开门${loginStore.isLogin}");
            Navigator.pushNamed(context, CommunityRoute.login);
          },
          padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
          child: Text(
            "OPEN",
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.w400),
          )),
    );
  }
}

class SelectDropDown extends StatefulWidget {
  @override
  _SelectDropDownState createState() => _SelectDropDownState();
}

class _SelectDropDownState extends State<SelectDropDown> {
  String villageValue;
  String gateValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 50.0, top: 30.0, right: 50.0, bottom: 20.0),
      child: new Column(
        children: <Widget>[
          ListTile(
            title: new Text(
              '选择小区：',
            ),
            trailing: DropdownButton<String>(
              value: villageValue,
              hint: const Text('请选择'),
              onChanged: (String newValue) {
                setState(() {
                  villageValue = newValue;
                });
              },
              items: <String>['天龙小区', '阳光小区', '湖畔小区', '花园小区']
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
              value: gateValue,
              hint: const Text('请选择'),
              onChanged: (String newValue) {
                setState(() {
                  gateValue = newValue;
                });
              },
              items: <String>['22座大门', '23座大门', '24座大门', '25座大门']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
