import 'package:flutter/material.dart';

class CalculateTotalPrice extends ChangeNotifier{

  double _price = 0;
  int _counter = 1;
  
  double get price => _price;
  int get counter => _counter;

  setPrice(double price) {
    _price = price;
  }

  cleanCounter() {
    _counter = 1;
  }

  increase() {
    _counter++;
    notifyListeners();
  }

  decrease() {
    if (_counter > 1) {
      _counter--;
    }
    notifyListeners();
  }
}