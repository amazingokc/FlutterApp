import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _GridViewPage();
  }
}

class _GridViewPage extends State {
  List<IconData> _icons = []; //保存Icon数据

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GridView"),
        ),
        body:
//      GridView(
//        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//          crossAxisCount: 3,
//          childAspectRatio: 1
//        ),
//
//        children: <Widget>[
//          Icon(Icons.ac_unit),
//          Icon(Icons.ac_unit),
//          Icon(Icons.ac_unit),
//          Icon(Icons.ac_unit),
//          Icon(Icons.ac_unit),
//        ],
//      ),

//      GridView(
//        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//            maxCrossAxisExtent: 250,
//            childAspectRatio: 1
//        ),
//
//        children: <Widget>[
//          Icon(Icons.ac_unit),
//          Icon(Icons.ac_unit),
//          Icon(Icons.ac_unit),
//          Icon(Icons.ac_unit),
//          Icon(Icons.ac_unit),
//        ],
//      ),

            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 1),
                itemCount: _icons.length,
                itemBuilder: (context, index) {
                  if (index == _icons.length - 1 && _icons.length < 200) {
                    _retrieveIcons();
                  } else if (_icons.length == 0) {
                    _retrieveIcons();
                  }
                  return Icon(_icons[index]);
                }));
  }

  @override
  void initState() {
    // 初始化数据
    _retrieveIcons();
  }

  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }
}
