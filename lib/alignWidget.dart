import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class AlignPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _AlignPage();
  }
}

class _AlignPage extends State<AlignPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("对齐、相对定位、变换"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 120.0,
              width: 120.0,
              alignment: Alignment.topLeft,
              color: Colors.blue[50],
              child: Align(
//                widthFactor: 2,
//                heightFactor: 2,
//          alignment: Alignment(0.0,0.0),
                alignment: FractionalOffset(0.5, 0.5),
                child: FlutterLogo(
                  size: 60.0,
                ),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.red,
                  gradient:
                      LinearGradient(colors: [Colors.red, Colors.blue[700]])),
              child: Center(
                child: Text("xxx"),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.green),
              child: Center(
                widthFactor: 2,
                heightFactor: 2,
                child: Text("xxx"),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
            ),
            Container(
              color: Colors.black,
              child: new Transform(
                alignment: Alignment.topRight,
                transform: new Matrix4.skewY(0.3),
                child: new Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.deepOrange,
                  child: Text("AAAAAAAAAAA"),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            ),
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Transform.translate(
                offset: Offset(20, 5),
                child: Text("AAAAAA"),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
            ),
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Transform.rotate(
                angle: math.pi / 2,
                child: Text("aaaaaaa"),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
            ),
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Transform.scale(
                scale: 1.5,
                child: Text("aaaaaaa"),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: Text("aaaa"),
                  ),
                ),
                Text(
                  "你好",
                  style: TextStyle(color: Colors.green, fontSize: 18.0),
                )
              ],
            )
          ],
        ));
  }
}
