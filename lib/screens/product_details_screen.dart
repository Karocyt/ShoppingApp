import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String route = '/product-details';
  // final String id;

  ProductDetailsScreen();

  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
      title: Text(id),
    ));
  }
}
