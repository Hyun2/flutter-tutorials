import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_provider/models/cart_state.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: Provider.of<CartState>(context)
            .items
            .map((item) => Text(item['title']))
            .toList(),
      )),
    );
  }
}
