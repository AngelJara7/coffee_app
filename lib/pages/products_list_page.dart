import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../widgets/widgets.dart';

class ProductsListPage extends StatelessWidget {
   
  const ProductsListPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final productProvider = Provider.of<ProductProvider>(context).products;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu_rounded, color: Colors.black, size: 28,), 
          onPressed: () {},
        ),

        title: HeaderPage(
          titlePage: 'Coffee Selection',
          textLogo: 'NEURO ',
          textpage: 'COFFEE HOUSE ', 
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
          ListView.builder(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 80),
            itemCount: productProvider.length,
            itemBuilder: (context, index) {
              final product = productProvider[index];

              return Column(
                children: [

                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'product_details_page', arguments: product);
                    },
                    child: _Product(
                      image: product.img,
                      productName: product.name,
                      productDescription: product.description,
                      value: product.value,
                      price: product.price
                    ),
                  ),
                  const SizedBox(height: 20,)
                ],
              );
            },
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
            Color.fromRGBO(128, 128, 128, 0.5),
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
    final Widget widget = Text('\$$price', style: GoogleFonts.lora(fontSize: 12, fontWeight: FontWeight.w300, color: Colors.white),);

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
        PriceProduct(diameter: 0.13, widget: widget,),
      ]
    );
  }
}