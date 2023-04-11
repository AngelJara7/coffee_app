import 'package:coffee_app/models/products.dart';
import 'package:coffee_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

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

              DescriptionProduct(product: product),
            ],
          )
          : Row(
            children: [
              DescriptionProduct(product: product),

              _CardProduct(image: product.img),
            ],
          ),
        ),
        PriceProduct(diameter: 0.13, price: product.price, size: 12,),
      ],
    );
    // ClipRRect(
    //   borderRadius: const BorderRadius.all(Radius.circular(20)),
    //   child: SizedBox(
    //     height: 220,
    //     width: 170,
    //     child: Image.asset(image, fit: BoxFit.fill,)
    //   ),
    // );
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