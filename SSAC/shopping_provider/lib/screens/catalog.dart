import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_provider/items.dart';
import 'package:shopping_provider/models/cart_state.dart';
import 'package:shopping_provider/screens/cart.dart';

class Catalog extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Catalog> {
  List _items = items;

  @override
  Widget build(BuildContext context) {
    // var isInCart =
    //     context.select<CartState, bool>((cart) => cart.items.contains(item));

    return Consumer(
      builder: (context, CartState cartState, child) {
        return Scaffold(
          appBar: CupertinoNavigationBar(
            middle: Text('Shopping'),
            trailing: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Cart(),
                  ));
                }),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => ListTile(
                    title: Text(_items[index]['title']),
                    trailing: cartState.items.contains(_items[index])
                        ? Icon(Icons.check)
                        : TextButton(
                            onPressed: () {
                              cartState.items.add(_items[index]);
                              print(cartState.items);
                            },
                            child: Text('ADD')),
                  ),
                  itemCount: _items.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
