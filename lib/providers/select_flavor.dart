import 'package:flutter/material.dart';

class SelectFalvor extends ChangeNotifier{

  List<String> _flavors = [];
  String _flavor = '';
  Color _textColor = Colors.white;
  Color _background = const Color.fromRGBO(45, 45, 45, 1);
  bool _selected = false;

  List get flavors => _flavors;
  String get flavor => _flavor;
  Color get textColor => _textColor;
  Color get background => _background;
  bool get selected => _selected;

  void setFlavors(List<String> flavors) {
    _flavors = flavors;
  }

  void setFlavor(String flavor) {
    _flavor = flavor;
    notifyListeners();
  }

  void setTextColor(Color textColor) {
    _textColor = textColor;
  }

  void setBackground(Color background) {
    _background = background;
  }

  void setSelected(bool selected) {
    _selected = selected;
    notifyListeners();
  }

  void selectedFlavor() {
    for (var element in _flavors) {
      if (element == _flavor) {
        setSelected(true);
        setTextColor(Colors.white);
        setBackground(const Color.fromRGBO(45, 45, 45, 1));
        print('TRUE: $textColor, $background, $element');
        notifyListeners();
        //return;
      } else {
        setSelected(false);
        setTextColor(const Color.fromRGBO(45, 45, 45, 1));
        setBackground(Colors.white);
        print('FALSE: $textColor, $background, $element');
        notifyListeners();
      }
      // notifyListeners();
    }
  }
}