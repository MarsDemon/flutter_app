
import 'package:flutter/material.dart';

class GetStateWidget extends StatefulWidget {
  const GetStateWidget({Key key});
  _GetStateWidgetState createState() => _GetStateWidgetState();
}

class _GetStateWidgetState extends State<GetStateWidget> {

  @override
  void initState() {
    super.initState();
    // 初始化状态
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("子树中获取 State 对象"),
      ),
      body: Center(
        child: Builder(builder: (context) {
          return RaisedButton(
            onPressed: () {
              // 查找父级最近的 Scaffold 对应的 ScaffoldState 对象
              ScaffoldState _state =
              context.ancestorStateOfType(TypeMatcher<ScaffoldState>());
              // 调用 ScaffoldState 的 showSnackBar 来弹出 SnackBar
              _state.showSnackBar(SnackBar(
                content: Text("测试"),
              ));
            },
          );
        },),
      ),
    );
  }

  @override
  void didUpdateWidget(GetStateWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactive");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reasseble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}