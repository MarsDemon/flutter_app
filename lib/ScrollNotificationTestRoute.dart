import 'package:flutter/material.dart';

class ScrollNotificationTestRoute extends StatefulWidget {
  @override
  _ScollNotificationTestRouteState createState() =>
      _ScollNotificationTestRouteState();
}

class _ScollNotificationTestRouteState
    extends State<ScrollNotificationTestRoute> {
  String _progress = "0%"; // 保存进度百分比

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      // 进度条
      // 监听滚动通知
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notofication) {
          double progress = notofication.metrics.pixels /
              notofication.metrics.maxScrollExtent;
          // 重新构建
          setState(() {
            _progress = "${(progress * 100).toInt()}%";
          });
          print("BottomEdge: ${notofication.metrics.extentAfter == 0}");
          return true; // 放弃此行注释后，进度条将失效
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ListView.builder(
                itemCount: 100,
                itemExtent: 50.0,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("$index"),
                  );
                }),
            CircleAvatar(
              // 显式进度百分比
              radius: 30.0,
              child: Text(_progress),
              backgroundColor: Colors.black54,
            )
          ],
        ),
      ),
    );
  }
}
