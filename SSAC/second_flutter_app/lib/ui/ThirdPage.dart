import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('내 정보'),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: () {}),
          TextButton(onPressed: () {}, child: Text('환영합니다'))
        ],
      ),
      body: Center(child: Text('3 페이지')),
    );
  }
}
