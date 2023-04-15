import 'package:coffee_app/models/models.dart';
import 'package:flutter/material.dart';

class OrdersProviders extends ChangeNotifier{

  Orders order;
  Products product;
  Flavors flavors;

  OrdersProviders(this.order, this.product, this.flavors);
}