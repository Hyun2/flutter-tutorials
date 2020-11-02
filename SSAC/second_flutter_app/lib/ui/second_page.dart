import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('이용서비스'),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(child: Text('2 페이지')),
    );
  }
}
