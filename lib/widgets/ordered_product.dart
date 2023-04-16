import 'package:coffee_app/services/orders_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:coffee_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class OrderedProduct extends StatelessWidget {

  const OrderedProduct({super.key, required this.products, required this.index});

  final Map products;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            height: double.infinity,
            width: 120,
            child: Image.asset((products['img'].toString()), fit: BoxFit.fill,)
          ),
        ),
        
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: MediaQuery.of(context).size.width * 0.28,
          width: MediaQuery.of(context).size.width * 0.55,
          decoration: _boxDecoration(),

          child: _DetailsProductOrdered(products: products, index: index),
        )
      ],
    );
  }

  BoxDecoration _boxDecoration() => BoxDecoration(
    borderRadius: const BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 2,
        blurRadius: 7,
        offset: const Offset(2, 5)
      ),
    ],
    color: Colors.white
  );
}

class _DetailsProductOrdered extends StatelessWidget {

  const _DetailsProductOrdered({required this.products, required this.index,});

  final Map products;
  final int index;

  @override
  Widget build(BuildContext context) {

    Provider.of<OrdersServices>(context);
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            Text(products['name'], style: GoogleFonts.lora(fontSize: 20, fontWeight: FontWeight.w600, color: const Color.fromRGBO(45, 45, 45, 1)),),

            IconButton(
              onPressed: () {
                final ordersServices = Provider.of<OrdersServices>(context, listen: false);
                ordersServices.removeProduct(products);
              },
              icon: const Icon(Icons.close_rounded, size: 25, color: Color.fromRGBO(128, 128, 128, 1),),
              alignment: Alignment.topRight,
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

            Text('\$${products['subtotal']}', style: GoogleFonts.lora(fontSize: 18, fontWeight: FontWeight.w500, color: const Color.fromRGBO(45, 45, 45, 1)),),

            AmountButton(height: 30, width: 110, fontSize: 16, counter: products['cantidad'],index: index)
          ],
        )
      ],
    );
  }
}