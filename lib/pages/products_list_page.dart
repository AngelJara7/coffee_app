import 'package:coffee_app/services/orders_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';
import '../widgets/widgets.dart';

class ProductsListPage extends StatelessWidget {
   
  const ProductsListPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final ordersServices = Provider.of<OrdersServices>(context);
    final productProvider = Provider.of<ProductProvider>(context).products;

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,

        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(
                Icons.menu_rounded, size: 33, color: Color.fromRGBO(45, 45, 45, 1),
              ),
            );
          }
        ),

        title: const HeaderPage(titlePage: 'Coffee Selection', textLogo: 'NEURO ', textpage: 'COFFEE HOUSE ', icon: Icons.coffee_sharp, color: Color.fromRGBO(45, 45, 45, 1), fontSizeTitle: 20, fontSize: 10,),

        actions: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined, color: Color.fromRGBO(45, 45, 45, 1), size: 30,), 
                onPressed: () => Navigator.pushNamed(context, 'product_order_page'),
              ),

              Container(
                height: 9,
                width: 9,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: ordersServices.verifyEmptyCart() ? Colors.transparent : Colors.redAccent,
                ),
              )
            ],
          ),
        ],
      ),

      drawer: const SideMenu(),
      
      body: productProvider.isEmpty
      ? const Center(
        child: CircularProgressIndicator.adaptive(
          backgroundColor: Color.fromRGBO(45, 45, 45, 1),
          strokeWidth: 2,
        ),
      )
      : Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 80),
            itemCount: productProvider.length,
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'product_details_page', arguments: productProvider[index]);
                }, 
                child: CardProduct(product: productProvider[index],)
              ),
            ),
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

    return Container(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
      height: MediaQuery.of(context).size.height * 0.11,
      width: double.infinity,
      decoration: _boxDecoration(),

      child: TextField(
        style: GoogleFonts.poppins(fontSize: 14, color: const Color.fromRGBO(128, 128, 128, 1)),
        decoration: _inputDecoration(),
      ),
    );
  }

  BoxDecoration _boxDecoration() => const BoxDecoration(
    color: Colors.white,
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(255, 255, 255, 0),
        Color.fromRGBO(128, 128, 128, 0.5),
        Color.fromRGBO(128, 128, 128, 0.8)
      ]
    )
  );

  InputDecoration _inputDecoration() => const InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: 25),
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
      color: Color.fromRGBO(128, 128, 128, 1),
      fontFamily: 'GoogleFonts.poppins()'
    ),
    suffixIcon: Icon(Icons.search, color: Color.fromRGBO(128, 128, 128, 1),)
  );
}