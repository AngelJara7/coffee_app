import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PriceProduct extends StatelessWidget {
  
  const PriceProduct({super.key, required this.diameter, required this.price, required this.size,});

  final double diameter;
  final double price;
  final double size;

  @override
  Widget build(BuildContext context) {

    const boxDecoration = BoxDecoration(
      color: Color.fromRGBO(45, 45, 45, 1),
      borderRadius: BorderRadius.all(Radius.circular(50))
    );
    
    final double diameterCircle = MediaQuery.of(context).size.width * diameter;

    return Container(
      alignment: Alignment.center,
      height: diameterCircle,
      width: diameterCircle,
      decoration: boxDecoration,
      child: Text('\$ $price', style: GoogleFonts.lora(fontSize: size, color: Colors.white),)
    );
  }
}