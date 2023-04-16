import 'dart:async';

import 'package:flutter/material.dart';

class OrdersServices extends ChangeNotifier {

  // final List<dynamic> _order = [];
  final List<dynamic> _product = [];
  int counter = 0;
  double _total = 0;
  bool _addCart = false;
  bool _cleanOptions = true;

  List get getAllProducts => _product;
  double get total => _total;
  bool get addCart => _addCart;
  bool get cleanOptions => _cleanOptions;

  setCleanOptions(bool value) {
    _cleanOptions = value;
  }

  createOrder(Map<String, dynamic> product, bool value) {
    _product.add(product);
    calculateTotal();
    addVerify(value);
  }

  calculateTotal() {
    _total = 0;
    for (var element in _product) {
      _total += element['subtotal'];
    }
  }

  addVerify(bool value) {
    _addCart = value;
    notifyListeners();
    Timer(const Duration(milliseconds: 3000), () {
      _cleanOptions = false;
      _addCart = false;
      notifyListeners();
    });
  }

  removeProduct(Map<dynamic, dynamic> product) {
    _product.remove(product);
    calculateTotal();
    notifyListeners();
  }

  updateCantProduct(dynamic cant, int index) {
    if (cant <= 0) {
      removeProduct(_product[index]);
    } else {
      _product[index]['cantidad'] = cant;
      _product[index]['subtotal'] = cant * _product[index]['price'];
      notifyListeners();
    }
  }

  bool verifyEmptyCart() {
    return _product.isEmpty ? true : false;
  }
}