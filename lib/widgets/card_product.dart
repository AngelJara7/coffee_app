import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:coffee_app/models/models.dart';

class CardProduct extends StatelessWidget {
  
  const CardProduct({super.key, required this.product});

  final Products product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: product.value == 1 ? Alignment.bottomRight : Alignment.bottomLeft,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          child: product.value == 1 
          ? Row(
            children: [
              _CardProduct(product: product),
              _CardProductDescription(product: product),
            ],
          )
          : Row(
            children: [
              _CardProductDescription(product: product),
              _CardProduct(product: product),
            ],
          ),
        ),
        _PriceProduct(price: product.price,),
      ],
    );
  }
}

class _CardProduct extends StatelessWidget {

  const _CardProduct({required this.product,});

  final Products product;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: SizedBox(
        height: double.infinity,
        width: 170,
        child: Image.asset(product.img, fit: BoxFit.fill,)
      ),
    );
  }
}

class _CardProductDescription extends StatelessWidget {

  const _CardProductDescription({required this.product,});

  final Products product;

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 170,
      width: 180,
      padding: const EdgeInsets.only(left: 25, right: 20),
      decoration: _boxDecoration(),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Text(product.name, style: GoogleFonts.lora(fontSize: 20, fontWeight: FontWeight.w500,), selectionColor: const Color.fromRGBO(45, 45, 45, 1),),

          const SizedBox(height: 10,),
          
          Text(product.description, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400,), selectionColor: const Color.fromRGBO(45, 45, 45, 0), maxLines: 4,overflow: TextOverflow.ellipsis,)
        ],
      )
    );
  }

  BoxDecoration _boxDecoration() => BoxDecoration(
    borderRadius: product.value == 1 
    ? const BorderRadius.horizontal(right: Radius.circular(20))
    : const BorderRadius.horizontal(left: Radius.circular(20)),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        spreadRadius: 2,
        blurRadius: 7,
        offset: product.value == 1 ? const Offset(3, 6) : const Offset(-3, 6)
      ),
    ],
    color: Colors.white
  );
}

class _PriceProduct extends StatelessWidget {
  
  const _PriceProduct({required this.price,});

  final double price;

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.width * 0.13,
      width: MediaQuery.of(context).size.width * 0.13,
      decoration: _boxDecoration(),
      child: Text('\$ $price', style: GoogleFonts.lora(fontSize: 14, color: Colors.white),)
    );
  }

  BoxDecoration _boxDecoration() => const BoxDecoration(
    color: Color.fromRGBO(45, 45, 45, 1),
    borderRadius: BorderRadius.all(Radius.circular(50))
  );
}