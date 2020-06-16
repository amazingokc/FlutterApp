import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollControllerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ScrollControllerState();
  }
}

class _ScrollControllerState extends State {
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false; //是否显示"返回顶部"按钮

  String _progress = "0%";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ScrollController"),
      ),
      body:

//      Scrollbar(
//        child: ListView.builder(
//          itemBuilder: (context, index) {
//            return ListTile(
//              title: Text("$index"),
//            );
//          },
//          itemCount: 100,
//          itemExtent: 50, //列表项高度固定时，显式指定高度是一个好习惯(性能消耗小)
//          controller: _controller,
//        ),
//      ),

          Scrollbar(
        child: NotificationListener<ScrollNotification>(
          // ignore: missing_return
          onNotification: (ScrollNotification notification) {
            double progress = notification.metrics.pixels /
                notification.metrics.maxScrollExtent;

            setState(() {
              _progress = "${(progress * 100).toInt()}%";
            });
            print("BottomEdge: ${notification.metrics.extentAfter == 0}");
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ListView.builder(
                itemBuilder: (context, indext) {
                  return ListTile(
                    title: Text("$indext"),
                  );
                },
                itemCount: 100,
                itemExtent: 50,
              ),
              CircleAvatar(
                radius: 30,
                child: Text(_progress),
                backgroundColor: Colors.black54,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _controller.animateTo(.0,
                    duration: Duration(microseconds: 500), curve: Curves.ease);
              },
            ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print(_controller.offset); //打印滚动位置
      if (_controller.offset < 1500 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1500 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
