import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  String name;

  SecondPage(String name) {
    this.name = name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$name')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => {Navigator.pop(context, '두 번째 페이지에 갔다왔군요.')},
                child: Text('닫기'))
          ],
        ),
      ),
    );
  }
}
