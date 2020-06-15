import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ListViewPage();
  }
}

class _ListViewPage extends State {
//  static const loadingTag = "##loading##"; //表尾标记
  static const loadingTag = "1"; //表尾标记
  var _words = <String>[loadingTag];

  String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ11";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ListView"),
        ),
        body:

        /**
         * 默认构造函数有一个children参数，它接受一个Widget列表（List）。这种方式适合只有少量的
         * 子组件的情况，因为这种方式需要将所有children都提前创建好（这需要做大量工作），
         * 而不是等到子widget真正显示的时候再创建，也就是说通过默认构造函数构建的ListView
         * 没有应用基于Sliver的懒加载模型。实际上通过此方式创建的ListView和使用
         * SingleChildScrollView+Column的方式没有本质的区别
         * */
//      ListView(
//        shrinkWrap: true,
//        padding: EdgeInsets.all(20.0),
//        children: <Widget>[
//          const Text("I\'m dedicating every day to you"),
//          const Text("I\'m dedicating every day to you"),
//          const Text("I\'m dedicating every day to you"),
//          const Text("I\'m dedicating every day to you"),
//          const Text("I\'m dedicating every day to you"),
//        ],
//      ),
//            ListView.builder(
//                itemCount: 1500,
//                itemExtent: 50,
//                itemBuilder: (BuildContext cotext, int index) {
//                  return ListTile(
//                    title: Text("$index"),
//                  );
//                }),

//          ListView.separated(
//              itemBuilder: (BuildContext context, int index) {
//                return ListTile(
//                  title: Text("$index"),
//                );
//              },
//              separatorBuilder: (BuildContext context, int index) {
//                return index % 2 == 0
//                    ? Divider(
//                        color: Colors.blue,
//                      )
//                    : Divider(
//                        color: Colors.green,
//                      );
//              },
//              itemCount: 100),
        ListView.separated(
            itemBuilder: (context, index) {
              if (_words[index] == loadingTag) {
                if (_words.length < 100) {
                  _retrieveData();
                  return Container(
                    padding: const EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ),
                  );
                } else {
                  return Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(16),
                    child: Text("没有更多了", style: TextStyle(color: Colors.grey),),
                  );
                }
              }
              return ListTile(title: Text(_words[index]),);
            },

            separatorBuilder: (context, index) => Divider(height: .0,),
            itemCount: _words.length));
  }

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((onValue) {
      setState(() {
        _words.insertAll(
            _words.length - 1, str.split("").map((f) => f.toString()).toList());
      });
    });
  }
}
