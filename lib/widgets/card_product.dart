import 'package:flutter/material.dart';

import 'package:coffee_app/models/models.dart';
import 'package:coffee_app/widgets/widgets.dart';

class CardProduct extends StatelessWidget {
  
  const CardProduct({super.key, required this.product});

  final Products product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: product.value == 1 ? Alignment.bottomRight : Alignment.bottomLeft,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.24,
          child: product.value == 1 
          ? Row(
            children: [
              _CardProduct(image: product.img),

              CardProductDescription(product: product),
            ],
          )
          : Row(
            children: [
              CardProductDescription(product: product),

              _CardProduct(image: product.img),
            ],
          ),
        ),
        PriceProduct(price: product.price,),
      ],
    );
  }
}

class _CardProduct extends StatelessWidget {

  const _CardProduct({required this.image,});

  final String image;

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