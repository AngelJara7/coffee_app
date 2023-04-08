import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/widgets.dart';

class CoffeeListPage extends StatelessWidget {
   
  const CoffeeListPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black, size: 28,), 
          onPressed: () {},
        ),

        title: HeaderPage(
          titlePage: 'Coffee Selection',
          textLogo: 'NEURO',
          textpage: 'COFFEE HEOUSE', 
          icon: Icons.coffee_sharp,
        ),
        backgroundColor: Colors.white,
        elevation: 0,

        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black, size: 28,), 
            onPressed: (){},
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  _Product(
                    image: 'assets/coffee_latte.jpg',
                    productName: 'Café Latte',
                    productDescription: 'Ullamco id incididunt ut et cupidatat laboris officia consequat.',
                    value: 1,
                    price: 6.79,
                  ),
                  SizedBox(height: 25,),
                  _Product(
                    image: 'assets/frappuccino.jpg',
                    productName: 'Frappuccino',
                    productDescription: 'Laborum laboris culpa officia elit consequat labore irure aute nulla.',
                    value: 2,
                    price: 6.99,
                  ),
                  SizedBox(height: 25,),
                  _Product(
                    image: 'assets/cappuccino.jpg',
                    productName: 'Cappuccino',
                    productDescription: 'Aute deserunt dolor anim ad cupidatat consectetur sit.',
                    value: 1,
                    price: 5.49,
                  ),
                  SizedBox(height: 25,),
                  _Product(
                    image: 'assets/expreso.jpg',
                    productName: 'Expreso',
                    productDescription: 'Do ullamco amet cupidatat tempor quis laboris et deserunt.',
                    value: 2,
                    price: 6.79,
                  ),
                  SizedBox(height: 25,),
                  _Product(
                    image: 'assets/americano.jpg',
                    productName: 'Americano',
                    productDescription: 'Non voluptate nisi officia in quis non laboris aute pariatur ad.',
                    value: 1,
                    price: 5.79,
                  ),
                  SizedBox(height: 25,),
                  _Product(
                    image: 'assets/cafe_con_leche.jpg',
                    productName: 'Café con leche',
                    productDescription: 'Proident velit minim ex occaecat.',
                    value: 2,
                    price: 4.59,
                  ),
                  SizedBox(height: 100,),
                ],
              ),
            ],
          ),
          const _BottomSearchBar()
        ],
      ),
    );
  }
}

class _BottomSearchBar extends StatelessWidget {
  const _BottomSearchBar();

  @override
  Widget build(BuildContext context) {
    const boxDecoration = BoxDecoration(
        color: Colors.white,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(255, 255, 255, 0),
            Color.fromRGBO(128, 128, 128, 0.4),
            Color.fromRGBO(128, 128, 128, 1)
          ]
        )
      );
    const inputDecoration = InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: 'Browse for your favorite coffee',
          hintStyle: TextStyle(
            color: Color.fromRGBO(128, 128, 128, 1)
          ),
          suffixIcon: Icon(Icons.search, color: Color.fromRGBO(128, 128, 128, 1),)
        );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: MediaQuery.of(context).size.height * 0.1,
      width: double.infinity,
      decoration: boxDecoration,

      child: TextField(
        style: GoogleFonts.poppins(fontSize: 13, color: const Color.fromRGBO(128, 128, 128, 1)),
        decoration: inputDecoration,
      ),
    );
  }
}

class _Product extends StatelessWidget {

  final String image;
  final String productName;
  final String productDescription;
  final int value;
  final double price;

  const _Product({
    required this.image, required this.productName, required this.productDescription, required this.value, required this.price});

  @override
  Widget build(BuildContext context) {

    final height =  MediaQuery.of(context).size.height;
    
    const boxDecoration = BoxDecoration(
            color: Color.fromRGBO(45, 45, 45, 1),
            borderRadius: BorderRadius.all(Radius.circular(50))
          );

    return Stack(
      alignment: value == 1 ? Alignment.bottomRight : Alignment.bottomLeft,
      children: [
        Container(
          alignment: Alignment.topRight,
          height: height * 0.24,
          child: value == 1 ? Row(
            children: [
              Product1(image: image),
              DescriptionProduct1(
                productName: productName,
                productDescription: productDescription,
                value: value,
              )
            ],
          )
          : Row(
            children: [
              DescriptionProduct1(
                productName: productName,
                productDescription: productDescription,
                value: value,
              ),
              Product1(image: image),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 50,
          width: 50,
          decoration: boxDecoration,
          child: Text('\$$price', style: GoogleFonts.lora(fontSize: 12, fontWeight: FontWeight.w300, color: Colors.white),),
        ),
      ]
    );
  }
}