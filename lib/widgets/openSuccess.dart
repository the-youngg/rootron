import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OpenSuccess extends StatefulWidget {
  final String positionValue;
  final String doorValue;

  OpenSuccess({Key key, this.positionValue, this.doorValue}) : super(key: key);

  @override
  _OpenSuccessState createState() => _OpenSuccessState();
}

class _OpenSuccessState extends State<OpenSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("解锁成功"),
        centerTitle: true,
        automaticallyImplyLeading: false,
//        leading: IconButton(
//          icon: Icon(Icons.close),
//          onPressed: () {},
//        ),
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.more_horiz),
//            onPressed: () {},
//          ),
//        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 80.0),
        color: Colors.white,
        child: Center(
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/icons/gou.png',
                width: 120.0, //屏幕最大宽度
                height: 120.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "解锁成功",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 80.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                  ),
                  Expanded(
                    child: Text(
                      DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.positionValue + widget.doorValue + "大门",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15.0),
                  ),
                ],
              ),
              Divider(),
              SizedBox(
                height: 50.0,
              ),
              SizedBox(
                width: 140.0,
                height: 40.0,
                child: FlatButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("完成"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
