import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaffoldPage extends StatefulWidget {
  @override
  _ScaffoldWidget createState() {
    return new _ScaffoldWidget();
  }
}

class _ScaffoldWidget extends State<ScaffoldPage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 1;
  TabController _tabController;
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      switch (_tabController.index) {
        case 1:

        case 2:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Scaffold、TabBar"),
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            )
          ],
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(
                  Icons.dashboard,
                  color: Colors.white,
                ), //自定义图标
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          bottom: TabBar(
            controller: _tabController,
//          controller: TabController(length: tabs.length, vsync: this),
            tabs: tabs.map((e) => Tab(text: e)).toList(),
            indicatorColor: Colors.black,
          ),
        ),

        drawer: new MyDrawer(),
        //抽屉

//      bottomNavigationBar: BottomNavigationBar(
//        //底部导航
//        items: <BottomNavigationBarItem>[
//          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.business), title: Text("Business")),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.school), title: Text("School")),
//        ],
//        currentIndex: _selectedIndex,
//        fixedColor: Colors.red,
//        onTap: _onItemTap,
//      ),

        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
          child: Row(
            children: <Widget>[
              IconButton(icon: Icon(Icons.home),),
              SizedBox(),
              IconButton(icon: Icon(Icons.home),)
            ],
          ),
        ),

        body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          //创建3个Tab页
          return Container(
            alignment: Alignment.center,
            child: Text(
              e,
              textScaleFactor: 5,
            ),
          );
        }).toList()),);
  }

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {}
}

class MyDrawer extends Drawer {
  @override
  Widget build(BuildContext context) {
    var imgUrl = NetworkImage(
        "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4");

    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 38),
                child: Row(
                  children: <Widget>[
//                    Padding(
//                      padding: const EdgeInsets.symmetric(horizontal: 1.0),
//                      child:
//                    ),
                    Image(
                      image: imgUrl,
                      height: 100.0,
                      width: 100.0,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      "xiao",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.add),
                      title: const Text("Add account"),
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text("Manage account"),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
