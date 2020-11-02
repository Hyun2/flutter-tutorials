import 'dart:math';

import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  int zero_or_one = new Random().nextInt(1);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  resetProb() {
    setState(() {
      widget.zero_or_one = new Random().nextInt(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Thanos')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.zero_or_one == 1
                ? Text('생존', style: TextStyle(fontSize: 20))
                : Text('사망', style: TextStyle(fontSize: 20)),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ElevatedButton(
                  onPressed: resetProb,
                  child: Text('Reset', style: TextStyle(fontSize: 20))),
            )
          ],
        ),
      ),
    );
  }
}
