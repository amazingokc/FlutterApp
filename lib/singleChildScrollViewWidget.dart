import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/scaffoldWidget.dart';
/**
 * 需要注意的是，通常SingleChildScrollView只应在期望的内容不会超过屏幕太多时使用，
 * 这是因为SingleChildScrollView不支持基于Sliver的延迟实例化模型，所以如果预计视口
 * 可能包含超出屏幕尺寸太多的内容时，那么使用SingleChildScrollView将会非常昂贵（性能差
 * ），此时应该使用一些支持Sliver延迟加载的可滚动组件，如ListView。
 * */
class SingleChildScrollViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SingleChildScrollView();
  }
}

class _SingleChildScrollView extends State {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ11";

    return Scaffold(
      appBar: AppBar(
        title: Text("SingleChildScrollView"),
      ),
      body: Scrollbar(

        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child:  Center(
            child: Column(
              children: str.split("").map((c) => Text(c, textScaleFactor: 2.0,))
                  .toList()
            ),
          ),
        ),
      ),
    );
  }
}
