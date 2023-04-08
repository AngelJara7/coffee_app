import 'package:coffee_app/pages/coffee_list_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "coffee_list",
      routes: {
        "coffee_list": (_) => const CoffeeListPage(),
      },
    );
  }
}