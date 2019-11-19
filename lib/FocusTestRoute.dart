import 'package:flutter/material.dart';

class FocusTestRoute extends StatefulWidget {
  @override
  _FocusTestRouteState createState() => new _FocusTestRouteState();
}

class _FocusTestRouteState extends State<FocusTestRoute> {
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            autofocus: true,

            /// 关联 focusNode1
            focusNode: focusNode1,
            decoration: InputDecoration(
                labelText: "input1"
            ),
          ),
          TextField(
            focusNode: focusNode2,
            decoration: InputDecoration(
                labelText: "input2"
            ),
          ),
          Builder(builder: (context) {
            return Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("移动焦点"),
                  onPressed: () {
                    if (null == focusScopeNode) {
                      focusScopeNode = FocusScope.of(context);
                    }
                    focusScopeNode.requestFocus(focusNode2);
                  },
                ),
                RaisedButton(
                    child: Text("隐藏键盘"),
                    onPressed: () {
                      // 当所有编辑框都是去焦点时键盘就会收起
                      focusNode1.unfocus();
                      focusNode2.unfocus();
                    })
              ],
            );
          })
        ],
      ),
    );
  }
}
