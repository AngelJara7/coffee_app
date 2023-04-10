import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/product.dart';

class DescriptionProduct extends StatelessWidget {

  const DescriptionProduct({super.key, required this.product,});

  final Product product;

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 150,
      width: 180,
      padding: const EdgeInsets.only(left: 20, right: 20),
      decoration: product.value == 1
      ? _boxDecoration1()
      : _boxDecoration2(),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Text(product.name, style: GoogleFonts.lora(fontSize: 18, fontWeight: FontWeight.w500,), selectionColor: const Color.fromRGBO(45, 45, 45, 1),),

          const SizedBox(height: 10,),
          
          Text(product.description, style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400,), selectionColor: const Color.fromRGBO(45, 45, 45, 0),)
        ],
      )
    );
  }

  BoxDecoration _boxDecoration1() => BoxDecoration(
    borderRadius: const BorderRadius.horizontal(right: Radius.circular(20)),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        spreadRadius: 2,
        blurRadius: 7,
        offset: const Offset(3, 6)
      ),
    ],
    color: Colors.white
  );

  BoxDecoration _boxDecoration2() => BoxDecoration(
    borderRadius: const BorderRadius.horizontal(left: Radius.circular(20)),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        spreadRadius: 2,
        blurRadius: 7,
        offset: const Offset(-3, 6)
      ),
    ],
    color: Colors.white
  );
}