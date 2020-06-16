import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FutureTestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _FutureTestState();
  }
}

class _FutureTestState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future"),
      ),
      body: Center(
//        child: FutureBuilder<String>(
//          future: mockNetworkData(),
//          builder: (BuildContext cotext, AsyncSnapshot snapshot) {
//            //请求结束
//            if (snapshot.connectionState == ConnectionState.done) {
//              if (snapshot.hasError) {
//                return Text("Error: ${snapshot.error}");
//              } else {
//                return Text("Content: ${snapshot.data}");
//              }
//            } else {
//              return CircularProgressIndicator();
//            }
//          },
//        ),

      /**
       * 凡是UI会依赖多个异步数据而发生变化的场景都可以使用StreamBuilder。
       * */
        child: StreamBuilder<int>(
          stream: counter(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Text("Error: ${snapshot.hasError}");
            }
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text("no stream");
              case ConnectionState.waiting:
                return Text("waiting......");
              case ConnectionState.active:
                return Text("active: ${snapshot.data}");
              case ConnectionState.done:
                return Text("stream closed");
            }
            return null;
          },
        ),
      ),
    );
  }

  Future<String> mockNetworkData() async {
    return Future.delayed(Duration(seconds: 2), () => "我是互联网上获取的数据");
  }

  Stream<int> counter() {
    return Stream.periodic(Duration(seconds: 1), (i) {
      return i;
    });
  }
}
