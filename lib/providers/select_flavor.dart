import 'package:flutter/material.dart';

class SelectFlavor extends ChangeNotifier{

  String _typeFlavor = '';
  final _flavor = 'flavors';
  
  String _typeMilk = '';
  final _milk = 'milks';

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

  cleanValues() {
    _typeFlavor = '';
    _typeMilk = '';
    // notifyListeners();
  }
}