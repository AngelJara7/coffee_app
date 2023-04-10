import 'package:coffee_app/pages/pages.dart';
import 'package:coffee_app/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ProductProvider(), lazy: false,)
    ],
    child: const MyApp(),
  )
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "products_list_page",
      routes: {
        "products_list_page": (_) => const ProductsListPage(),
        "product_details_page": (_) => const ProductDetailsPage()
      },
    );
  }
}