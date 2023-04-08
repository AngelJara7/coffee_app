import 'package:flutter/material.dart';

class Product1 extends StatelessWidget {

  final String image;
  
  const Product1({super.key, required this.image,});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: SizedBox(
        height: 220,
        width: 170,
        child: Image.asset(image, fit: BoxFit.fill,)
      ),
    );
  }
}