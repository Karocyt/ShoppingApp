import 'package:flutter/material.dart';

import '../models/products.dart';
import '../widgets/product_tile.dart';

import '../products.dart';

class ProductsOverviewScreen extends StatelessWidget {
  final List<Product> loadedProducts = dummyProducts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: loadedProducts.length,
        itemBuilder: (ctx, index) => ProductTile(
          imageUrl: loadedProducts[index].imageUrl,
          id: loadedProducts[index].id,
          title: loadedProducts[index].title,
        ),
        // FixedCrossAxis determines a strict colums number
        // FixedExtend determines element width and adjust columns accordingly
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
