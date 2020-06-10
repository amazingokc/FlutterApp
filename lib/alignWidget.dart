import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          title: Text("对齐与相对定位"),
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
              decoration: BoxDecoration(color: Colors.red),
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
            )
          ],
        ));
  }
}
