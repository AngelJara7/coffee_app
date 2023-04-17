import 'package:flutter/material.dart';

class SelectFlavor extends ChangeNotifier{

  int _counter = 1;

  String _typeFlavor = '';
  final _flavor = 'flavors';
  
  String _typeMilk = '';
  final _milk = 'milks';

  int get counter => _counter;

  String get typeFlavor => _typeFlavor;
  String get flavor => _flavor;

  String get typeMilk => _typeMilk;
  String get milk => _milk;

  establecerSabor(String text, String type) {
    if (type == _flavor) {
      _typeFlavor = text;
    } else {
      _typeMilk = text;
    }
    notifyListeners();
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

  cleanValues() {
    _typeFlavor = '';
    _typeMilk = '';
    _counter = 1;
  }
}