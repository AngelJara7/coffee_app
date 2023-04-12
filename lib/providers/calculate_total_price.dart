import 'package:flutter/material.dart';

class CalculateTotalPrice extends ChangeNotifier{

  double _price = 0;
  int _counter = 1;
  
  double get price => _price;
  int get counter => _counter;

  void setPrice(double price) {
    _price = price;
  }

  void setCounter(int counter) {
    _counter = counter;
  }

  void increase() {
    _counter++;
    notifyListeners();
  }

  void decrease() {
    if (_counter > 1) {
      _counter--;
    }
    notifyListeners();
  }
}