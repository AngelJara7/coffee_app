// To parse this JSON data, do
//
//     final newsResponse = newsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:coffee_app/models/products.dart';

class NewsResponse {
    NewsResponse({
        required this.orders,
    });

    List<Orders> orders;

    factory NewsResponse.fromRawJson(String str) => NewsResponse.fromJson(json.decode(str));

    factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
        orders: List<Orders>.from(json["orders"].map((x) => Orders.fromJson(x))),
    );
}

class Orders {
    Orders({
        required this.orderNumber,
        required this.products,
        required this.total,
    });

    int orderNumber;
    List<Products> products;
    double total;

    factory Orders.fromRawJson(String str) => Orders.fromJson(json.decode(str));

    factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        orderNumber: json["order_number"],
        products: List<Products>.from(json["products"].map((x) => Products.fromJson(x))),
        total: json["total"]?.toDouble(),
    );
}
