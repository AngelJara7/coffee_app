import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderPage extends StatelessWidget {
  final String titlePage;
  final String textLogo;
  final String textpage;
  final IconData icon;
  final Color color;
  final double fontSizeTitle;
  final double fontSize;

  const HeaderPage({super.key, required this.titlePage, required this.textLogo, required this.icon, required this.textpage, required this.color, required this.fontSizeTitle, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(titlePage, style: GoogleFonts.lora(fontWeight: FontWeight.w500, fontSize: fontSizeTitle, color: color)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(textLogo, style: GoogleFonts.lora(fontWeight: FontWeight.w500, fontSize: 11, color: color),),
            Text(textpage, style: GoogleFonts.lora(fontWeight: FontWeight.normal, fontSize: fontSize, color: color)),
            Icon(icon, size: 10, color: color,)
          ],
        )
      ],
    );
  }
}