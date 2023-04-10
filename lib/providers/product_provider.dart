import 'package:coffee_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductProvider extends ChangeNotifier{

  List<Product> products = [];
  final String routeFile = 'assets/product.json';

  ProductProvider() {
    getAllProduct();
  }

  Future<String> _getJsonData() async {
    final resp = await rootBundle.loadString(routeFile);
    return resp;
  }

  getAllProduct() async {
    final response = await _getJsonData();
    final jsonData = NewsResponse.fromRawJson(response);
    
    products = jsonData.product;
     notifyListeners();
  }
}