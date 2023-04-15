import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';

class AmountButton extends StatelessWidget {

  AmountButton({super.key, required this.height, required this.width, required this.fontSize, this.counter});
  
  final double height, width, fontSize;
  int? counter;

  @override
  Widget build(BuildContext context) {

    final calculatePrice = Provider.of<CalculateTotalPrice>(context);
    int? finalCounter = counter ?? calculatePrice.counter;

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
            onPressed: () => calculatePrice.decrease(),
            icon: const Icon(Icons.remove, color: Colors.white, size: 18,)
          ),

          Text('$finalCounter', style: GoogleFonts.poppins(fontSize: fontSize, fontWeight: FontWeight.w500, color: Colors.white),),

          IconButton(
            onPressed: () => calculatePrice.increase(),
            icon: const Icon(Icons.add, color: Colors.white, size: 18,)
          )
        ],
      ),
    );
  }
}