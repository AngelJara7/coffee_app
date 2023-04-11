import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AmountButton extends StatefulWidget {
  const AmountButton({super.key, required this.height, required this.width, required this.fontSize,});
  
  final double height, width, fontSize;

  @override
  State<AmountButton> createState() => _AmountButtonState();
}

class _AmountButtonState extends State<AmountButton> {

  int counter = 1;

  void increase() {
    counter++;
    setState(() {});
  }

  void decrease() {
    if (counter > 1) {
      counter--;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(45, 45, 45, 1),
        borderRadius: BorderRadius.circular(100),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => decrease(),
            icon: const Icon(Icons.remove, color: Colors.white, size: 20,)
          ),

          Text('$counter', style: GoogleFonts.poppins(fontSize: widget.fontSize, fontWeight: FontWeight.w600, color: Colors.white),),

          IconButton(
            onPressed: () => increase(),
            icon: const Icon(Icons.add, color: Colors.white, size: 20,)
          )
        ],
      ),
    );
  }
}