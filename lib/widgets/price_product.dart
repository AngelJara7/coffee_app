import 'package:flutter/material.dart';

class PriceProduct extends StatelessWidget {
  
  const PriceProduct({super.key, required this.diameter, required this.widget,});

  final double diameter;
  final Widget widget;

  @override
  Widget build(BuildContext context) {

    const boxDecoration = BoxDecoration(
      color: Color.fromRGBO(45, 45, 45, 1),
      borderRadius: BorderRadius.all(Radius.circular(50))
    );
    
    final double diamterCircle = MediaQuery.of(context).size.width * diameter;

    return Container(
      alignment: Alignment.center,
      height: diamterCircle,
      width: diamterCircle,
      decoration: boxDecoration,
      child: widget
    );
  }
}