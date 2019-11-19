import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchAndCheckBoxTextRoute extends StatefulWidget {
  @override
  _SwitchAndCheckBoxTextRoute createState() =>
      new _SwitchAndCheckBoxTextRoute();
}

class _SwitchAndCheckBoxTextRoute extends State<SwitchAndCheckBoxTextRoute> {
  // 维护单选开关状态
  bool _switchSelected = true;

  // 维护复选框状态
  bool _checkboxSelected = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          autofocus: true,
          decoration: InputDecoration(
            labelText: "用户名",
            hintText: "用户名或邮箱",
            prefixIcon: Icon(Icons.person),
          ),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: "密码",
            hintText: "您的登录密码",
            prefixIcon: Icon(Icons.lock),
          ),
          /// 是否隐藏正在编辑的文本，如用于输入密码场景等，文本内容会用“。”替换
          obscureText: true,
        ),
        TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: "Email",
            hintText: "电子邮件地址",
            prefixIcon: Icon(Icons.email),
            /// 隐藏下划线
            border: InputBorder.none,
          ),
        )
      ],
//      children: <Widget>[
//        Switch(
//            value: _switchSelected,
//            onChanged: (value) {
//              // 重新构建页面
//              setState(() {
//                _switchSelected = value;
//              });
//            }),
//        Checkbox(
//            value: _checkboxSelected,
//            // 选中时的颜色
//            activeColor: Colors.red,
//            onChanged: (value) {
//              setState(() {
//                _checkboxSelected = value;
//              });
//            })
//      ],
    );
  }
}
