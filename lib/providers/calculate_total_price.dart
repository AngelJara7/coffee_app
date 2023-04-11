import 'package:flutter/material.dart';

class CalculateTotalPrice extends ChangeNotifier{

  int counter = 1;
  double price;

  CalculateTotalPrice(this.price) {
    increase();
    decrease();
  }

  void setPrice(double price_) {
    updatePrice(price_, counter);
    notifyListeners();
  }

  void increase() {
    counter++;
    updatePrice(price, counter);
    notifyListeners();
  }

  void decrease() {
    if (counter > 1) {
      counter--;
    }
    updatePrice(price, counter);
    notifyListeners();
  }

  double updatePrice(double price, int counter) {
    return price * counter;
  }
}