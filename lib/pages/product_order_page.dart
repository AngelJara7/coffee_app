import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:coffee_app/services/orders_services.dart';
import 'package:coffee_app/widgets/widgets.dart';

class ProductOrderPage extends StatelessWidget {

  const ProductOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ordersServices = Provider.of<OrdersServices>(context);
    List products = ordersServices.getAllProducts.toList();
    String total = (ordersServices.total).toStringAsFixed(2);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,

        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_rounded, size: 33, color: Color.fromRGBO(45, 45, 45, 1),)
        ),

        title: const HeaderPage(titlePage: 'My Order', textLogo: 'NEURO ', textpage: 'COFFEE HOUSE ', icon: Icons.coffee_sharp, color: Color.fromRGBO(45, 45, 45, 1), fontSizeTitle: 20, fontSize: 10,),

        actions: const [
          SizedBox(width: 5,)
        ],
      ),
      body: products.isEmpty 
      ? const _EmptyProductsOrdered()
      : _LoadingProductsOrdered(products: products, total: total)
    );
  }
}

class _EmptyProductsOrdered extends StatelessWidget {

  const _EmptyProductsOrdered();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Add products', style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w600, color: const Color.fromRGBO(45, 45, 45, 1)),),
      
            const SizedBox(height: 20,),
      
            Text('Your car is empty', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w400, color: const Color.fromRGBO(45, 45, 45, 1)),),
          ]
        ),
      ),
    );
  }
}

class _LoadingProductsOrdered extends StatelessWidget {
  
  const _LoadingProductsOrdered({required this.products,required this.total,});

  final List products;
  final String total;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      physics: const AlwaysScrollableScrollPhysics(),
      controller: ScrollController(
        initialScrollOffset: 0.0
      ),
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: products.length,
          itemBuilder: (context, index) =>Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 10),
            height: MediaQuery.of(context).size.width * 0.4,
            child: OrderedProduct(products: products[index], index: index),
          ),
        ),

        _PaymentDetailsProductsOrdered(total: total)
      ],
    );
  }
}

class _PaymentDetailsProductsOrdered extends StatelessWidget {

  const _PaymentDetailsProductsOrdered({required this.total,});

  final String total;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [

        Text('Discount Coupon', style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w700, color: const Color.fromRGBO(45, 45, 45, 1),), textAlign: TextAlign.start,),

        const SizedBox(height: 10,),

        const _EnterCouponDiscount(),

        const SizedBox(height: 50,),

        _TotalToPay(total: total, fontSize: 16,),

        const Divider(height: 15, color: Color.fromRGBO(128, 128, 128, 0.5), thickness: 2,),

        const SizedBox(height: 20,),

        _TotalToPay(total: total, fontSize: 20),

        const SizedBox(height: 20,),

        const ConfirmButton(text: 'Chekout', height: 50),

        const SizedBox(height: 20,)
      ],
    );
  }
}

class _EnterCouponDiscount extends StatelessWidget {

  const _EnterCouponDiscount();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.12,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          
          Container(
            alignment: Alignment.bottomLeft,
            height: double.infinity,
            width: MediaQuery.of(context).size.width * 0.6,
            decoration: _boxDecoration(),
              
            child: TextField(
              style: GoogleFonts.poppins(fontSize: 14, color: const Color.fromRGBO(128, 128, 128, 1)),
              decoration: _inputDecoration(),
            ),
          ),
          
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
              ),
              backgroundColor: const Color.fromRGBO(45, 45, 45, 1),
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 13)
            ),
            
            child: Text('Apply', style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),),
          ),
        ],
      ),
    );
  }

  BoxDecoration _boxDecoration() => const BoxDecoration(
    color: Colors.transparent,
    borderRadius: BorderRadius.all(Radius.circular(15)),
    boxShadow: [
      BoxShadow(
        color: Color.fromRGBO(45, 45, 45, 0.15),
        spreadRadius: 4,
        blurRadius: 7,
        offset: Offset(1, 2)
      )
    ]
  );
  
  InputDecoration _inputDecoration() => const InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      borderSide: BorderSide(
        width: 0,
        style: BorderStyle.none,
      ),
    ),
    filled: true,
    fillColor: Colors.white,
    hintText: 'Promo Code',
    hintStyle: TextStyle(
      color: Color.fromRGBO(128, 128, 128, 1),
      fontFamily: 'GoogleFonts.poppins()',
    ),
  );
}

class _TotalToPay extends StatelessWidget {

  const _TotalToPay({required this.total, required this.fontSize,});

  final String total;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('SubTotal', style: GoogleFonts.poppins(fontSize: fontSize, fontWeight: FontWeight.w600, color: const Color.fromRGBO(45, 45, 45, 1)),),

        Text('\$$total', style: GoogleFonts.poppins(fontSize: fontSize, fontWeight: FontWeight.w600, color: const Color.fromRGBO(45, 45, 45, 1)),)
      ],
    );
  }
}