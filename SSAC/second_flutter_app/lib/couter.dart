import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    Widget counter = Center(
      child: Text('$count',
          style: TextStyle(fontSize: 88, color: Colors.blueAccent[200])),
    );

    return Scaffold(
        appBar: AppBar(title: Text('COUNTER')),
        body: counter,
        floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() {
            print('clicked button');
            count++;
          }),
          tooltip: 'Increment Counter',
          child: Icon(Icons.plus_one),
          backgroundColor: Colors.green,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat);
  }
}
