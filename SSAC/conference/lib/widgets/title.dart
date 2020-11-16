import 'package:flutter/material.dart';

class ListTitle extends StatelessWidget {
  final String title;

  const ListTitle({Key key, this.title: ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Text(title, style: TextStyle(fontSize: 28)),
    );
  }
}
