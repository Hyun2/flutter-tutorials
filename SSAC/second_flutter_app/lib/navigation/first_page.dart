import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second_flutter_app/navigation/second_page.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Navigation Demo')),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(name),
          ElevatedButton(
              onPressed: () {
                Future<String> future = Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondPage('첫 번째 버튼을 눌렀군요!')));

                future.then((value) => {
                      setState(() {
                        name = value;
                      })
                    });
              },
              child: Text(
                'ElevatedButton',
                style: TextStyle(fontSize: 18),
              )),
          RaisedButton(
            onPressed: () => {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => SecondPage('두 번째 버튼을 눌렀군요!')))
            },
            child: Text('RaisedButton', style: TextStyle(fontSize: 18)),
          )
        ],
      ),
    );
  }
}
