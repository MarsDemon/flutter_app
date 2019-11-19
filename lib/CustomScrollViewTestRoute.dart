import 'package:flutter/material.dart';

class CustomScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 因为本路由没有使用Scaffold, 为了让子级 widget （如 text） 使用
    // Material Design 默认的样式风格，我们使用 Material  作为本路由的根。
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          // AppBar 包含一个导航栏
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("Demo"),
              background: Image.asset(
                "./iamge/avatar.png", fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(padding: const EdgeInsets.all(8.0),
            sliver: new SliverGrid(
                delegate: new SliverChildBuilderDelegate((BuildContext context,
                    int index) {
                  // 创建子 widget
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: new Text("grid item $index"),
                  );
                }, childCount: 20,),
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 4.0,
                )),),
          // list
          new SliverFixedExtentList(delegate: new SliverChildBuilderDelegate((BuildContext context, int index) {
            // 创建列表
            return new Container(
              alignment: Alignment.center,
              color: Colors.lightBlue[100 * (index % 9)],
              child: new Text("list item $index"),
            );
          },
          childCount: 50 // 50 个列表
          ), itemExtent: 50.0)
        ],
      ),
    );
  }
}