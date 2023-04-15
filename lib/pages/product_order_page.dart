import 'package:coffee_app/services/orders_services.dart';
import 'package:coffee_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductOrderPage extends StatelessWidget {

  const ProductOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ordersServices = Provider.of<OrdersServices>(context);
    List products = ordersServices.getAllProducts.toList();

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
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: products.length,
        itemBuilder: (context, index) => Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 10),
          height: MediaQuery.of(context).size.width * 0.45,
          width: double.infinity,

          child: OrderedProducts(products: products[index]),
        ),
      ),
    );
  }
}

class OrderedProducts extends StatelessWidget {

  const OrderedProducts({super.key, required this.products});

  final  Map products;

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
                  width: 135,
                  child: Image.asset((products['img'].toString()), fit: BoxFit.fill,)
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                height: MediaQuery.of(context).size.width * 0.33,
                width: MediaQuery.of(context).size.width * 0.52,
                decoration: BoxDecoration(
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
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(products['name'], style: GoogleFonts.lora(fontSize: 16, fontWeight: FontWeight.w600, color: const Color.fromRGBO(45, 45, 45, 1)),),

                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.close_rounded, size: 25, color: Color.fromRGBO(128, 128, 128, 1),),
                          alignment: Alignment.topRight,
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [

                        Text('\$${products['price']}', style: GoogleFonts.lora(fontSize: 16, fontWeight: FontWeight.w500, color: const Color.fromRGBO(45, 45, 45, 1)),),

                        AmountButton(height: 30, width: 110, fontSize: 16, counter: products['cantidad'],)
                      ],
                    )
                  ],
                ),
              )
            ],
          );
  }
}