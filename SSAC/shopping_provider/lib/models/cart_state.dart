import 'package:flutter/cupertino.dart';

class CartState extends ChangeNotifier {
  final List<Map> _items = [];
  List<Map> get items => _items;

  void add(Map item) {
    _items.add(item);
    notifyListeners();
  }

  void remove(Map item) {
    _items.remove(item);
    notifyListeners();
  }
}
