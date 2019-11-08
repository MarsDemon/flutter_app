import 'package:flutter/material.dart';

// 应用入口
void main() => runApp(MyApp()); // => 这是 Dart 中单行函数或方法的简写

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // 应用名称
      title: 'Flutter Demo',
      // 名为"/"的路由作为应用的home（首页）
      initialRoute: '/',
      theme: new ThemeData(
        // 蓝色主题
        primarySwatch: Colors.blue,
      ),
      // 注册路由表
      routes: {
        'new_page':(context)=>NewRoute(),
        // 注册首页路由
        '/':(context)=> MyHomePage(title: 'Flutter Demo Home Page',),
        // 可以添加其他路由注册信息
      },
      // 只会对命名路由生效
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          String routeName = settings.name;
          // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
          // 引导用户登录；其他情况则正常打开路由
        });
      },
      // 应用首页路由
//      home: new MyHomePage(
//        title: "Flutter Demo Home Page",
//      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 用于记录按钮点击的总次数
  int _counter = 0;

  // 设置状态自增函数
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // 构建 UI 函数
  @override
  Widget build(BuildContext context) {
    // 组件树
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                'you have pushed the button this many times:',
              ),
              new Text('$_counter', style: Theme
                  .of(context)
                  .textTheme
                  .display1),
              FlatButton(
                child: Text('open new route'),
                textColor: Colors.blue,
                onPressed: () {
                  // 通过路由名打开
                  Navigator.pushNamed(context, "new_page");
                  // 导航到新路由
//                  Navigator.push(context,
//                      MaterialPageRoute(builder: (context) {
//                        return NewRoute();
//                      }));
                },
              ),
            ],
          )),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}

// 新建一个路由
class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New rout'),
      ),
      body: Center(
        child: Text('This is new route'),
      ),
    );
  }
}
