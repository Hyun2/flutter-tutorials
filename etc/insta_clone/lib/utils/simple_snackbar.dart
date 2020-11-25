import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void simpleSnackbar(BuildContext context, String text) {
  Scaffold.of(context).showSnackBar(SnackBar(content: Text(text)));
}
