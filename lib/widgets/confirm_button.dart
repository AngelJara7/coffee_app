import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../services/orders_services.dart';

class ConfirmButton extends StatelessWidget {

  const ConfirmButton({super.key, required this.text, required this.height,});

  final String text;
  final double height;

  @override
  Widget build(BuildContext context) {

    final ordersService = Provider.of<OrdersServices>(context,);
    bool addCart = ordersService.addCart;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromRGBO(45, 45, 45, 1),
      ),
      child: !addCart
      ? Text(text, style: GoogleFonts.poppins(fontSize: 16, color: Colors.white,), textAlign: TextAlign.center,)
      : const CircularProgressIndicator(
        color: Colors.white,
        strokeWidth: 2,
      ),
    );
  }
}