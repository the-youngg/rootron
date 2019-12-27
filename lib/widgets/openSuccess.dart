import 'package:flutter/material.dart';

class OpenSuccess extends StatelessWidget {
  OpenSuccess({Key key}) : super(key: key);

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
                  Text(
                    "2019-12-27 16:04:30",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "花园小区1街2栋4座大门",
                    style: TextStyle(fontSize: 16),
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
