import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final String image;
  final double price;

  CartItem({
    required this.name,
    required this.image,
    required this.price,
  });
}

class CartProvider with ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  double get totalPrice {
    double total = 0;
    for (var item in _items) {
      total += item.price;
    }
    return total;
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}

