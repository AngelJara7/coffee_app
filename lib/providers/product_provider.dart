import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/models.dart';

class ProductProvider extends ChangeNotifier{

  List<Products> products = [];
  final String routeFile = 'assets/data/products.json';

  ProductProvider() {
    getAllProduct();
  }

  Future<String> _getJsonData() async {
    final resp = await rootBundle.loadString(routeFile);
    return resp;
  }

  getAllProduct() async {
    final response = await _getJsonData();
    final jsonData = NewsProducts.fromRawJson(response);
    products = jsonData.products;
    Timer(const Duration(milliseconds: 3500), () {
      notifyListeners();
    });
  }
}