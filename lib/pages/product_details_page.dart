import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../providers/providers.dart';
import 'package:coffee_app/widgets/widgets.dart';

class ProductDetailsPage extends StatelessWidget {
   
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Products product = ModalRoute.of(context)!.settings.arguments as Products;
       
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          _ProductImageDetails(price: product.price, image: product.img),

          _DetailsProduct(product: product),
        ],
      ),
    );

  }
}

class _DetailsProduct extends StatelessWidget {

  const _DetailsProduct({required this.product,});

  final Products product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(product.name, style: GoogleFonts.lora(fontSize: 24, fontWeight: FontWeight.w600, color: const Color.fromRGBO(45, 45, 45, 1))),

          const SizedBox(height: 5,),
          
          const _ProductScore(),

          const SizedBox(height: 15,),

          const AmountButton(height: 35, width: 140, fontSize: 20,),

          const SizedBox(height: 15,),

          const FlavorOptions(text: 'Add flavor', flavors: ['Vanilla', 'Caramel', 'Coconut'],),

          const SizedBox(height: 15,),

          const FlavorOptions(text: 'Pick Milk', flavors: ['Almond Milk', 'Soy Milk', 'Oat Milk'],),
          
          const SizedBox(height: 20,),
          
          const ConfirmButton(text: 'Add to Cart', height: 50,)
        ],
      ),
    );
  }
}

class _ProductImageDetails extends StatelessWidget {
  
  const _ProductImageDetails({required this.price, required this.image});
  
  final double price;
  final String image;
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: const EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 30),

          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            child: Image.asset(image, fit: BoxFit.fill, alignment: Alignment.center, width: double.infinity,),
          ),
        ),

        Positioned(
          top: 25,
          left: 10,
          child: _Container(),
        ),

        Positioned(
          bottom: 0,
          right: 10,
          child: _PriceProduct(price: price,)
        ),
      ],
    );
  }
}

class _PriceProduct extends StatelessWidget {
  
  const _PriceProduct({required this.price,});

  final double price;

  @override
  Widget build(BuildContext context) {

    final calculatePrice = Provider.of<CalculateTotalPrice>(context);
    calculatePrice.setPrice(price);
    String finalPrice = (price * calculatePrice.counter).toStringAsFixed(2);

    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.width * 0.22,
      width: MediaQuery.of(context).size.width * 0.22,
      decoration: _boxDecoration(),

      child: Text('\$ $finalPrice', style: GoogleFonts.lora(fontSize: 20, color: Colors.white),)
    );
  }

  BoxDecoration _boxDecoration() => const BoxDecoration(
    color: Color.fromRGBO(45, 45, 45, 1),
    borderRadius: BorderRadius.all(Radius.circular(50))
  );
}

class _ProductScore extends StatelessWidget {

  const _ProductScore();

  @override
  Widget build(BuildContext context) {

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('Filled with cream', style: GoogleFonts.lora(fontSize: 16, fontWeight: FontWeight.w500, color: const Color.fromRGBO(45, 45, 45, 1)),),

        const SizedBox(width: 10,),
        const Icon(Icons.star_rounded, size: 15, color: Colors.amber,),
        const Icon(Icons.star_rounded, size: 15, color: Colors.amber,),
        const Icon(Icons.star_rounded, size: 15, color: Colors.amber,),
        const Icon(Icons.star_rounded, size: 15, color: Colors.amber,),
        const Icon(Icons.star_rounded, size: 15, color: Colors.amber,),
      ]
    );
  }
}

class _Container extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final calculatePrice = Provider.of<CalculateTotalPrice>(context);

    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.width * 0.13,
      width: MediaQuery.of(context).size.width * 0.13,
      decoration: _boxDecoration(),
      child: IconButton(
        onPressed: (){
          calculatePrice.setCounter(1);
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_rounded, color: Color.fromRGBO(45, 45, 45, 1), size: 33,))
    );
  }

  BoxDecoration _boxDecoration() => BoxDecoration(
    borderRadius: BorderRadius.circular(100),
    color: const Color.fromARGB(255, 255, 255, 255)
  );
}