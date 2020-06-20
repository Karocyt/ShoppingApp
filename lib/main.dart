import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/products_overview_screen.dart';
import './screens/product_details_screen.dart';
import './providers/products_provider.dart';
import './providers/cart_provider.dart';
import './screens/cart_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //create: (ctx) => Products(), // use value if you don't need a builder
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Products()),
        ChangeNotifierProvider.value(value: Cart()),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato'),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailsScreen.route: (ctx) => ProductDetailsScreen(),
          CartScreen.route: (ctx) => CartScreen(),
        },
      ),
    );
  }
}
