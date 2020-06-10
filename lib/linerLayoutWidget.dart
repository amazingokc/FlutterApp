import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LinerLayoutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _LinerLayoutPage();
  }
}

class _LinerLayoutPage extends State<LinerLayoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("线性布局"),
      ),
      body: Padding(
        padding: EdgeInsets.all(0.0),
        child: Container(
          color: Colors.green,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("hello word"),
                  Text("I am Jack "),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("hello word"),
                  Text("I am Jack "),
                ],
              ),
              Row(
                /**
                 * MainAxisAlignment的参考系是TextDirection
                 * 1.当TextDirection.rtl时（从右到左的意思），MainAxisAlignment.end，则end是左，则是文本顺序是右到左，且靠左对齐；
                 * MainAxisAlignment.start,文本也是右到左，靠右对齐。
                 * 2.当TextDirection.ltr（从左到右的意思），MainAxisAlignment.end，则end是右，则是文本顺序是左到右，且靠右对齐；
                 * MainAxisAlignment.start,文本也是左到右，靠左对齐。
                 * */
                mainAxisAlignment: MainAxisAlignment.start,
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  Text("hello word"),
                  Text("I am Jack "),
                ],
              ),
              Row(
                /**
                 * CrossAxisAlignment的参考系为VerticalDirection
                 * 1.当VerticalDirection.up时（从下往上的意思），CrossAxisAlignment.start，则start是下，则是底部对齐；
                 * CrossAxisAlignment.end,则end是上，则是顶部对齐。
                 * 2.当VerticalDirection.down（从上往下的意思），CrossAxisAlignment.start，则start是上，则是顶部对齐；
                 * CrossAxisAlignment.end,则end是下，则是底部对齐。
                 * */
                crossAxisAlignment: CrossAxisAlignment.start,
                verticalDirection: VerticalDirection.up,
                children: <Widget>[
                  Text("hello world", style: TextStyle(fontSize: 30.0)),
                  Text("I am Jack "),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text("Hi"),
                  Text("world"),
                ],
              ),
              Expanded(
                child: Container(
                  color: Colors.red,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text("holle world"),
                      Text("I am Jack "),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
