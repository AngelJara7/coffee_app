import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';

class AmountButton extends StatelessWidget {
  const AmountButton({super.key, required this.height, required this.width, required this.fontSize,});
  
  final double height, width, fontSize;

  @override
  Widget build(BuildContext context) {

    final calculatePrice = Provider.of<CalculateTotalPrice>(context);
    int finalCounter = calculatePrice.counter;

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(45, 45, 45, 1),
        borderRadius: BorderRadius.circular(100),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              calculatePrice.decrease();
              //print("precio final: $finalPrice");
            },
            icon: const Icon(Icons.remove, color: Colors.white, size: 20,)
          ),

          Text('$finalCounter', style: GoogleFonts.poppins(fontSize: fontSize, fontWeight: FontWeight.w600, color: Colors.white),),

          IconButton(
            onPressed: () {
              calculatePrice.increase();
              //print("precio final: $finalPrice");
            },
            icon: const Icon(Icons.add, color: Colors.white, size: 20,)
          )
        ],
      ),
    );
  }
}