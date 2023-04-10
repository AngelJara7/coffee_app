import 'package:coffee_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/product.dart';

class ProductDetailsPage extends StatelessWidget {
   
  const ProductDetailsPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final Product product = ModalRoute.of(context)!.settings.arguments as Product;

    var text = Text('\$${product.price}', style: GoogleFonts.lora(fontSize: 20, color: Colors.white),);
                
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          _ProductImageDetails(context, text, product.img),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(product.name, style: GoogleFonts.lora(fontSize: 24, fontWeight: FontWeight.w600, color: const Color.fromRGBO(45, 45, 45, 1))),

                const SizedBox(height: 5,),
                
                const _ProductScore(),

                const SizedBox(height: 15,),

                const AmountButton(height: 35, width: 140, fontSize: 20,),

                const SizedBox(height: 15,),

                const _OptionsProduct(text: 'Add flavor', flavors: ['Vanilla', 'Caramel', 'Coconut'],),

                const SizedBox(height: 15,),

                const _OptionsProduct(text: 'Pick Milk', flavors: ['Almond Milk', 'Soy Milk', 'Oat Milk'],),
                
                const SizedBox(height: 20,),
                const ConfirmButton(text: 'Add to Cart', height: 50,)
              ],
            ),
          )
        ],
      ),
    );
  }

  Stack _ProductImageDetails(BuildContext context, Widget text, String image) {
    
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.52,
          padding: const EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 30),
          
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            child: Image.asset(image, fit: BoxFit.fill, alignment: Alignment.center, width: double.infinity,),
          ),
        ),

        Positioned(
          bottom: 0,
          right: 10,
          child: PriceProduct(diameter: 0.22, widget: text,)
        ),

        Positioned(
          top: 30,
          left: 10,
          child: _Container(),
        )
      ],
    );
  }
}

class _OptionsProduct extends StatelessWidget {
  const _OptionsProduct({required this.text, required this.flavors});

  final String text;
  final List<String> flavors;

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: GoogleFonts.lora(fontSize: 16, fontWeight: FontWeight.w600),),
        const SizedBox(height: 5,),
        
        Wrap(
          runSpacing: 7,
          children: [
            for(var flavor in flavors) OptionsProductSelect(text: flavor)
          ],
        ),
      ],
    );
  }
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
        const Icon(Icons.star, size: 15, color: Colors.amber,),
        const Icon(Icons.star, size: 15, color: Colors.amber,),
        const Icon(Icons.star, size: 15, color: Colors.amber,),
        const Icon(Icons.star, size: 15, color: Colors.amber,),
        const Icon(Icons.star, size: 15, color: Colors.amber,),
      ]
    );
  }
}

class _Container extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.width * 0.12,
      width: MediaQuery.of(context).size.width * 0.12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromARGB(255, 255, 255, 255)
      ),
      child: IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_rounded, color: Color.fromRGBO(45, 45, 45, 1), size: 35,))
    );
  }
}