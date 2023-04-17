import 'package:coffee_app/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../services/orders_services.dart';

class FlavorsOptions extends StatelessWidget {

  const FlavorsOptions({super.key, required this.text, required this.flavors,});

  final String text;
  final Map<String, List<String>> flavors;

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: GoogleFonts.lora(fontSize: 18, fontWeight: FontWeight.w600),),
        const SizedBox(height: 5,),
        Wrap(
          runSpacing: 8,
          children: [
            for(var flavor in flavors.values) for(var element in flavor) _FlavorOptions(text: element, flavors: flavor, value: flavors.keys.last),
          ],
        )
      ],
    );
  }
}

class _FlavorOptions extends StatelessWidget {

  const _FlavorOptions({required this.text, required this.flavors, required this.value,});

  final String text;
  final List<String> flavors;
  final String value;

  @override
  Widget build(BuildContext context) {

    final selectFlavors = Provider.of<SelectFlavor>(context);
    final ordersService = Provider.of<OrdersServices>(context);

    if (ordersService.cleanValues) selectFlavors.cleanValues(); ordersService.setCleanValues();
    
    Color background = Colors.white;
    Color textColor = const Color.fromRGBO(45, 45, 45, 1);
    String typeFlavor = selectFlavors.typeFlavor;
    String typeMilk = selectFlavors.typeMilk;
    
    if((typeFlavor == text) || (typeMilk == text)) {
      background = const Color.fromRGBO(45, 45, 45, 1);
      textColor = Colors.white;
    }
    
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1, color: const Color.fromRGBO(45, 45, 45, 1))
        ),
        child: Text(text, style: GoogleFonts.poppins(fontSize: 16, color: textColor)),
      ),
      onTap: () {
        selectFlavors.establecerSabor(text, value);
      },
    );
  }
}
