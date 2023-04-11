import 'package:coffee_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/product.dart';

class ProductDetailsPage extends StatefulWidget {
   
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {

  int counter = 1;

  void increase() {
    counter++;
  }

  void decrease() {
    if (counter > 1) {
      counter--;
    }
  }

  @override
  Widget build(BuildContext context) {

    final Product product = ModalRoute.of(context)!.settings.arguments as Product;
       
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          _ProductImageDetails(price: product.price, image: product.img),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(product.name, style: GoogleFonts.lora(fontSize: 24, fontWeight: FontWeight.w600, color: const Color.fromRGBO(45, 45, 45, 1))),

                const SizedBox(height: 5,),
                
                const _ProductScore(),

                const SizedBox(height: 15,),

                _AmountButton(counter: counter, price: product.price),

                const SizedBox(height: 15,),

                const _OptionsFlavors(text: 'Add flavor', flavors: ['Vanilla', 'Caramel', 'Coconut'],),

                const SizedBox(height: 15,),

                const _OptionsFlavors(text: 'Pick Milk', flavors: ['Almond Milk', 'Soy Milk', 'Oat Milk'],),
                
                const SizedBox(height: 20,),
                
                const ConfirmButton(text: 'Add to Cart', height: 50,)
              ],
            ),
          ),
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
          bottom: 0,
          right: 10,
          child: PriceProduct(diameter: 0.22, price: price, size: 20)
        ),

        Positioned(
          top: 25,
          left: 10,
          child: _Container(),
        )
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

class _AmountButton extends StatefulWidget {

  _AmountButton({required this.counter, required this.price});

  int counter;
  double price;

  @override
  State<_AmountButton> createState() => _AmountButtonState();
}

class _AmountButtonState extends State<_AmountButton> {
  int count = 1;

  void increase() {
    count++;
    setState(() {});
  }

  void decrease() {
    if (count > 1) {
      count--;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 35,
      width: 140,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(45, 45, 45, 1),
        borderRadius: BorderRadius.circular(100),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              decrease();
            },
            icon: const Icon(Icons.remove, color: Colors.white, size: 20,)
          ),

          Text('$count', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),),

          IconButton(
            onPressed: () {
              increase();
            },
            icon: const Icon(Icons.add, color: Colors.white, size: 20,)
          )
        ],
      ),
    );
  }
}

class _OptionsFlavors extends StatelessWidget {

  const _OptionsFlavors({required this.text, required this.flavors});

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
            for(var flavor in flavors) FlavorOptions(text: flavor)
          ],
        ),
      ],
    );
  }
}

class _Container extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.width * 0.13,
      width: MediaQuery.of(context).size.width * 0.13,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromARGB(255, 255, 255, 255)
      ),
      child: IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_rounded, color: Color.fromRGBO(45, 45, 45, 1), size: 33,))
    );
  }
}