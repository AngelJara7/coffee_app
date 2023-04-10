import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlavorOptions extends StatelessWidget {

  const FlavorOptions({super.key, required this.text,});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 1, color: const Color.fromRGBO(45, 45, 45, 1))
      ),
      child: Text(text, style: GoogleFonts.poppins(fontSize: 15),),
    );
  }
}