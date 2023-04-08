import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionProduct1 extends StatelessWidget {
  final String productName;
  final String productDescription;
  final int value;

  const DescriptionProduct1({super.key, required this.productName, required this.productDescription, required this.value,});

  @override
  Widget build(BuildContext context) {

    var boxDecoration1 = BoxDecoration(
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

    var boxDecoration2 = BoxDecoration(
      borderRadius: const BorderRadius.horizontal(left: Radius.circular(20)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 7,
          offset: const Offset(-2, 7)
        ),
      ],
      color: Colors.white
    );

    return Container(
      height: 150,
      width: 180,
      padding: const EdgeInsets.only(left: 20, right: 20),
      decoration: value == 1
      ? boxDecoration1
      : boxDecoration2,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Text(productName, style: GoogleFonts.lora(fontSize: 18, fontWeight: FontWeight.w500), selectionColor: const Color.fromRGBO(45, 45, 45, 0),),
          const SizedBox(height: 10,),
          Text(productDescription, selectionColor: const Color.fromRGBO(45, 45, 45, 0), overflow: TextOverflow.visible, style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400),)
        ],
      )
    );
  }
}