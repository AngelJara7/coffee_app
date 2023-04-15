// To parse this JSON data, do
//
//     final newsResponse = newsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:coffee_app/models/models.dart';

class NewsProducts {
    NewsProducts({
        required this.products,
    });

    List<Products> products;

    factory NewsProducts.fromRawJson(String str) => NewsProducts.fromJson(json.decode(str));

    factory NewsProducts.fromJson(Map<String, dynamic> json) => NewsProducts(
        products: List<Products>.from(json["products"].map((x) => Products.fromJson(x))),
    );
}

class Products {
    Products({
        required this.id,
        required this.name,
        required this.img,
        required this.description,
        required this.value,
        required this.cantidad,
        required this.price,
        this.flavors,
        this.subtotal
    });

    String id;
    String name;
    String img;
    String description;
    int value;
    int cantidad;
    double price;
    List<Flavors>? flavors;
    double? subtotal;

    factory Products.fromRawJson(String str) => Products.fromJson(json.decode(str));

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        name: json["name"],
        img: json["img"],
        description: json["description"],
        value: json["value"],
        cantidad: json["cantidad"],
        price: json["price"]?.toDouble(),
        flavors: json["flavors"],
        subtotal: json["subtotal"],
    );
}
