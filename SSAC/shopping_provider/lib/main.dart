import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_provider/models/cart_state.dart';
import 'package:shopping_provider/screens/catalog.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<CartState>.value(value: CartState()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Catalog(),
    );
  }
}
