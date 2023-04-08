import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderPage extends StatelessWidget {
  final String titlePage;
  final String textLogo;
  final String textpage;
  final font = GoogleFonts.lora();
  final IconData icon;

  HeaderPage({super.key, required this.titlePage, required this.textLogo, required this.icon, required this.textpage,});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(titlePage, style: GoogleFonts.lora(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black,)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(textLogo, style: GoogleFonts.lora(fontWeight: FontWeight.w500, fontSize: 11, color: Colors.black,),),
            Text(textpage, style: GoogleFonts.lora(fontWeight: FontWeight.normal, fontSize: 9, color: Colors.black,)),
            Icon(icon, size: 10, color: Colors.black,)
          ],
        )
      ],
    );
  }
}