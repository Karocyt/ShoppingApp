import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String route = '/product-details';
  // final String id;

  ProductDetailsScreen();

  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context).settings.arguments;
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(id);

    return Scaffold(
        appBar: AppBar(
      title: Text(loadedProduct.title),
    ));
  }
}
