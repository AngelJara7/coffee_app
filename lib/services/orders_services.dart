import 'package:flutter/material.dart';

class OrdersServices extends ChangeNotifier {

  // final List<dynamic> _order = [];
  final List<dynamic> _product = [];
  int counter = 0;
  double _total = 0;

  List get getAllProducts => _product;
  double get total => _total;

  createOrder(Map<String, dynamic> products) {
    _total = 0;
    _product.add(products);
    for (var element in _product) {
      _total += element['subtotal'];
    }
    notifyListeners();
  }

}