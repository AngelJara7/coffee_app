import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PriceProduct extends StatelessWidget {
  
  const PriceProduct({super.key, required this.price,});

  final double price;

  @override
  Widget build(BuildContext context) {

    final double diameterCircle = MediaQuery.of(context).size.width * 0.13;

    return Container(
      alignment: Alignment.center,
      height: diameterCircle,
      width: diameterCircle,
      decoration: _boxDecoration(),
      child: Text('\$ $price', style: GoogleFonts.lora(fontSize: 12, color: Colors.white),)
    );
  }

  BoxDecoration _boxDecoration() => const BoxDecoration(
    color: Color.fromRGBO(45, 45, 45, 1),
    borderRadius: BorderRadius.all(Radius.circular(50))
  );
}