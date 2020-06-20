import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/product_tile.dart';
import '../providers/products_provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool _favoritesOnly;

  ProductsGrid(this._favoritesOnly);

  @override
  Widget build(BuildContext context) {
    final loadedProducts = _favoritesOnly
        ? Provider.of<Products>(context).favorites
        : Provider.of<Products>(context).items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: loadedProducts.length,
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
            //create: (ctx) => Products(), // use value if you don't need a builder
            value: loadedProducts[index],
            child: ProductTile()),
      // FixedCrossAxis determines a strict colums number
      // FixedExtend determines element width and adjust columns accordingly
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
