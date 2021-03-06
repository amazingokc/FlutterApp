import 'package:flutter/material.dart';
import 'package:flutterapp/scaffoldWidget.dart';
import 'package:flutterapp/scrollController.dart';
import 'package:flutterapp/singleChildScrollViewWidget.dart';
import 'package:flutterapp/theme.dart';

import 'BaseWidget.dart';
import 'alignWidget.dart';
import 'containerWidget.dart';
import 'customScrollViewWidget.dart';
import 'future.dart';
import 'gridViewWidget.dart';
import 'linerLayoutWidget.dart';
import 'flexWidget.dart';
import 'listViewWidget.dart';
import 'wrapAndFlowWidget.dart';
import 'frameLayoutWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
//        home: MyHomePage(title: 'Flutter Demo Home Page'),
        routes: {
          "new_page": (context) => NewRoute(),
          "BaseWidgetPage": (context) => BaseWidgetPage(),
          "LinerLayoutPage": (context) => LinerLayoutPage(),
          "WrapAndFlowPage": (context) => WrapAndFlowPage(),
          "FlexPage": (context) => FlexPage(),
          "FrameLayoutPage": (context) => FrameLayoutPage(),
          "AlignPage": (context) => AlignPage(),
          "ContainerPage": (context) => ContainerPage(),
          "ScaffoldPage": (context) => ScaffoldPage(),
          "SingleChildScrollViewPage": (context) => SingleChildScrollViewPage(),
          "ListViewPage": (context) => ListViewPage(),
          "GridViewPage": (context) => GridViewPage(),
          "CustomScrollViewPage": (context) => CustomScrollViewPage(),
          "ScrollControllerPage": (context) => ScrollControllerPage(),
          "ThemeTestPage": (context) => ThemeTestPage(),
          "FutureTestPage": (context) => FutureTestPage(),
          "/": (context) => MyHomePage(title: 'Flutter Demo Home Page'),
//          "/": (context) => FutureTestPage(),
//
          //注册首页路由
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class NewRoute extends StatelessWidget {
  NewRoute({
    Key key,
    @required this.count,
  }) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text('$count'),
              RaisedButton(
                onPressed: () => Navigator.pop(context, '1'),
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime _lastPressedAt; //上次点击时间
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
//            Text(
//              'You have pushed the button this many times222:',
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.display1,
//            ),
//            FlatButton(
//              child: Text("open new route"),
//              textColor: Colors.blue,
//              onPressed: () async {
//                //导航到新路由
////                var result = await Navigator.push(context,
////                    MaterialPageRoute(builder: (context) {
////                  return NewRoute(
////                    count: _counter,
////                  );
////                }));
//                var result = await Navigator.pushNamed(context, "new_page");
//
//                //输出`TipRoute`路由返回结果
//                print("路由返回值: $result");
//              },
//            ),

            WillPopScope(
              onWillPop: () async {
                if (_lastPressedAt == null ||
                    DateTime.now().difference(_lastPressedAt) >
                        Duration(seconds: 1)) {
                  _lastPressedAt = DateTime.now();
                  return false;
                }
                return true;
              },
              child: Container(
                alignment: Alignment.center,
                child: Text("1秒内连续按两次返回键退出"),
              ),
            ),

            RaisedButton(
              child: Text("基础组件"),
              onPressed: () {
                Navigator.pushNamed(context, "BaseWidgetPage");
              },
            ),
            RaisedButton(
              child: Text("线性布局"),
              onPressed: () {
                Navigator.pushNamed(context, "LinerLayoutPage");
              },
            ),
            RaisedButton(
              child: Text("弹性布局"),
              onPressed: () {
                Navigator.pushNamed(context, "FlexPage");
              },
            ),
            RaisedButton(
              child: Text("流式布局"),
              onPressed: () {
                Navigator.pushNamed(context, "WrapAndFlowPage");
              },
            ),
            RaisedButton(
              child: Text("层叠布局"),
              onPressed: () {
                Navigator.pushNamed(context, "FrameLayoutPage");
              },
            ),
            RaisedButton(
              child: Text("对齐与相对定位"),
              onPressed: () {
                Navigator.pushNamed(context, "AlignPage");
              },
            ),
            RaisedButton(
              child: Text("容器"),
              onPressed: () {
                Navigator.pushNamed(context, "ContainerPage");
              },
            ),
            RaisedButton(
              child: Text("Scaffold"),
              onPressed: () {
                Navigator.pushNamed(context, "ScaffoldPage");
              },
            ),
            RaisedButton(
              child: Text("SingleChildScrollViewPage"),
              onPressed: () {
                Navigator.pushNamed(context, "SingleChildScrollViewPage");
              },
            ),
            RaisedButton(
              child: Text("ListViewPage"),
              onPressed: () {
                Navigator.pushNamed(context, "ListViewPage");
              },
            ),
            RaisedButton(
              child: Text("GridViewPage"),
              onPressed: () {
                Navigator.pushNamed(context, "GridViewPage");
              },
            ),
            RaisedButton(
              child: Text("CustomScrollViewPage"),
              onPressed: () {
                Navigator.pushNamed(context, "CustomScrollViewPage");
              },
            ),
            RaisedButton(
              child: Text("ScrollControllerPage"),
              onPressed: () {
                Navigator.pushNamed(context, "ScrollControllerPage");
              },
            ),
            RaisedButton(
              child: Text("ThemeTestPage"),
              onPressed: () {
                Navigator.pushNamed(context, "ThemeTestPage");
              },
            ),
            RaisedButton(
              child: Text("FutureTestPage"),
              onPressed: () {
                Navigator.pushNamed(context, "FutureTestPage");
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
