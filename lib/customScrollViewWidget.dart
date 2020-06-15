import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomScrollViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _CustomScrollView();
  }
}

class _CustomScrollView extends State {
  var imgUrl = NetworkImage(
      "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4");

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
                title: const Text("Demo"),
                background: Image(
                  image: imgUrl,
                  fit: BoxFit.cover,
                )),
          ),
          SliverPadding(
            padding: EdgeInsets.all(18),
            sliver: new SliverGrid(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 4),
                delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  //创建子Widget
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * index % 9],
                    child: new Text("list item $index"),
                  );
                }, childCount: 50)),
          )
        ],
      ),
    );
  }

}
