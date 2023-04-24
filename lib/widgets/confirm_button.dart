import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmButton extends StatelessWidget {

  const ConfirmButton({super.key, required this.text, required this.height, required this.loading,});

  final dynamic text;
  final double height;
  final bool loading;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromRGBO(45, 45, 45, 1),
      ),
      child: loading
      ? const CircularProgressIndicator.adaptive(
        backgroundColor: Colors.white,
        valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(45, 45, 45, 1)),
        strokeWidth: 3,
      )
      : Text(text.toString(), style: GoogleFonts.poppins(fontSize: 16, color: Colors.white,), textAlign: TextAlign.center,)
    );
  }
}