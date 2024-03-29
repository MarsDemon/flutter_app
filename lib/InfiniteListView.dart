import 'package:flutter/material.dart';

class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = "##loading##"; // 表尾标记
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          // 如果到了表尾
          if (_words[index] == loadingTag) {
            // 不足 100 条，继续获取数据
            if (_words.length - 1 < 100) {
              // 获取数据
              _retrieveData();
              // 加载时显示 loading
              return Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0,),
                ),
              );
            } else {
              // 已经加载了 100 条数据， 不再获取数据
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Text("没有更多了", style: TextStyle(color: Colors.grey),),
              );
            }
          }
          // 显示单词列表项
          return ListTile(title: Text(_words[index]));
        },
        separatorBuilder: (context, index) => Divider(height: .0),
        itemCount: _words.length);
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(
          _words.length - 1,
          // 每次生产 20 个单词
//          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {
        // 重新构建列表
      });
    });
  }
}
