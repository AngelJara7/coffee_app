import 'package:flutter/material.dart';

class CalculateTotalPrice extends ChangeNotifier{

  int _counter = 1;
  
  int get counter => _counter;

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