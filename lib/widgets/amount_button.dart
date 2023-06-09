import 'package:coffee_app/services/orders_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';

// ignore: must_be_immutable
class AmountButton extends StatelessWidget {

  AmountButton({super.key, required this.height, required this.width, required this.fontSize, this.counter, this.index});
  
  final double height, width, fontSize;
  int? counter, index;

  @override
  Widget build(BuildContext context) {

    final ordersService = Provider.of<OrdersServices>(context);
    final selectFlavors = Provider.of<SelectFlavor>(context);
    int? finalCounter = 0;

    if (ordersService.cleanValues) selectFlavors.cleanValues(); ordersService.setCleanValues();
    
    finalCounter = counter ?? selectFlavors.counter;

    return Container(
      constraints: const BoxConstraints(
        minWidth: 125
      ) ,
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
              if (index == null) {
                selectFlavors.decrease();
              } else {
                counter = (counter! - 1);
                ordersService.updateCantProduct(counter, index!);
              }
          },
            icon: const Icon(Icons.remove, color: Colors.white, size: 18,)
          ),

          Text('$finalCounter', style: GoogleFonts.poppins(fontSize: fontSize, fontWeight: FontWeight.w500, color: Colors.white),),

          IconButton(
            onPressed: () {
              if (index == null) {
                selectFlavors.increase();
              } else {
                counter = (counter! + 1);
                ordersService.updateCantProduct(counter, index!);
              }
            },
            icon: const Icon(Icons.add, color: Colors.white, size: 18,)
          )
        ],
      ),
    );
  }
}