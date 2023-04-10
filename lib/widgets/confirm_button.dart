import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmButton extends StatelessWidget {

  const ConfirmButton({super.key, required this.text, required this.height,});

  final String text;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromRGBO(45, 45, 45, 1),
      ),
      child: Text(text, style: GoogleFonts.poppins(fontSize: 16, color: Colors.white,), textAlign: TextAlign.center,),
    );
  }
}