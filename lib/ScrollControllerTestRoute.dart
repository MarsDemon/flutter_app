import 'package:flutter/material.dart';

/// 当滚动位置发生变化时，我们先打印出当前滚动位置，然后判断当前位置是否超过1000像素，
/// 如果超过则在屏幕右下角显示一个“返回顶部”的按钮，
/// 该按钮点击后可以使ListView恢复到初始位置；如果没有超过1000像素，则隐藏“返回顶部”按钮
class ScrollControllerTestRoute extends StatefulWidget {
  @override
  _ScrollControllerTestRouteState createState() =>
      _ScrollControllerTestRouteState();
}

class _ScrollControllerTestRouteState extends State<ScrollControllerTestRoute> {
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false; // 是否显示“返回到顶部”按钮

  @override
  void initState() {
    super.initState();
    // 监听滚动事件，打印滚动位置
    _controller.addListener(() {
      print(_controller.offset); // 打印滚动位置
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    // 为了避免内存泄漏，需要调用 _controller.dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("滚动控制")),
      body: Scrollbar(
          child: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("$index"),
          );
        },
        itemCount: 100,
        itemExtent: 50.0, // 列表项高度固定时，显式指定高度是一个好习惯（性能消耗小）
        controller: _controller,
      )),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                // 返回到顶部时执行动画
                _controller.animateTo(.0,
                    duration: Duration(milliseconds: 200), curve: Curves.ease);
              }),
    );
  }
}
