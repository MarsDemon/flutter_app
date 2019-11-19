import 'package:flutter/material.dart';

class FormTestRoute extends StatefulWidget {
  @override
  _FormTestRouteState createState() => _FormTestRouteState();
}

class _FormTestRouteState extends State<FormTestRoute> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Test"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Form(
          /// 设置 globalKey, 用于 后面获取 FormState
          key: _formKey,

          /// 开启自动检测
          autovalidate: true,
          child: Column(
            children: <Widget>[
              TextFormField(
                /// 是否自动获取焦点
                autofocus: true,
                controller: _unameController,

                /// 定义输入框样式
                decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱",
                    icon: Icon(Icons.person)),

                /// 校验用户名
                validator: (v) {
                  return v.trim().length > 0 ? null : "用户名不能为空";
                },
              ),
              TextFormField(
                controller: _pwdController,
                decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "您的登录密码",
                    icon: Icon(Icons.lock)),
                obscureText: true,
                validator: (v) {
                  return v.trim().length > 5 ? null : "密码不能少于六位";
                },
              ),

              /// 登录按钮
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: RaisedButton(
                      padding: EdgeInsets.all(15.0),
                      child: Text("登录"),
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      onPressed: () {
                        /// 在这里不能通过此方法获取 FormState, context 不对
                        /// print(Form.of(context));
                        /// 通过 _formKey.currentState 获取FromState 后
                        /// 调用 validate() 方法校验用户密码是否合法，校验
                        /// 通过后再提交数据
                        if((_formKey.currentState as FormState).validate()) {
                          /// 验证通过后再提交数据
                        }
                      },
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
