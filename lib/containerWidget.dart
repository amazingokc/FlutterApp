import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ContainerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ContainerPage();
  }
}

class _ContainerPage extends State<ContainerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("容器"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 50, left: 50),
            constraints: BoxConstraints.tightFor(width: 200, height: 150),
            //卡片大小
            decoration: BoxDecoration(
              //背景装饰
                gradient: RadialGradient(
                  //背景径向渐变
                    colors: [Colors.red, Colors.orange],
                    center: Alignment.topLeft,
                    radius: 0.98),
                boxShadow: [
                  //卡片阴影
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(1, 1),
                      blurRadius: 4.0)
                ]),
            transform: Matrix4.rotationZ(0.1),
            alignment: Alignment.center,
            child: Text(
              "55",
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),

          ),
          Container(
//            constraints: BoxConstraints.tightFor(width: 200, height: 150),
//            alignment: Alignment.center,
            margin: EdgeInsets.all(50),
            color: Colors.orange,
            child: Text("aaaa"),
          ),
          Container(
            padding: EdgeInsets.all(50),
            color: Colors.orange,
            child: Text("aaaa"),
          )
        ],
      )


    );
  }
}
