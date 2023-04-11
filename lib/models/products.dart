// To parse this JSON data, do
//
//     final newsResponse = newsResponseFromJson(jsonString);

import 'dart:convert';

class NewsResponse {
    NewsResponse({
        required this.product,
    });

    List<Products> product;

    factory NewsResponse.fromRawJson(String str) => NewsResponse.fromJson(json.decode(str));

    // String toRawJson() => json.encode(toJson());

    factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
        product: List<Products>.from(json["products"].map((x) => Products.fromJson(x))),
    );

    // Map<String, dynamic> toJson() => {
    //     "product": List<dynamic>.from(product.map((x) => x.toJson())),
    // };
}

class Products {
    Products({
        required this.id,
        required this.name,
        required this.img,
        required this.description,
        required this.value,
        required this.price,
    });

    String id;
    String name;
    String img;
    String description;
    int value;
    double price;

    factory Products.fromRawJson(String str) => Products.fromJson(json.decode(str));

    // String toRawJson() => json.encode(toJson());

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        name: json["name"],
        img: json["img"],
        description: json["description"],
        value: json["value"],
        price: json["price"],
    );

    // Map<String, dynamic> toJson() => {
    //     "id": id,
    //     "name": name,
    //     "img": img,
    //     "description": description,
    //     "value": value,
    //     "price": price,
    // };
}
