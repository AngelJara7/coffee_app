
import 'dart:convert';

class Flavors {
    Flavors({
        this.flavor,
        this.milk,
    });

    String? flavor;
    String? milk;

    factory Flavors.fromRawJson(String str) => Flavors.fromJson(json.decode(str));

    factory Flavors.fromJson(Map<String, dynamic> json) => Flavors(
        flavor: json["flavor"],
        milk: json["milk"],
    );
}