import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';
import '../screens/product_details_screen.dart';

class ProductTile extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(ProductDetailsScreen.route, arguments: product.id), 
        child: GridTile(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
              color: Theme.of(context).accentColor,
              icon: product.isFavorite ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border),
              onPressed: () {},
            ),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
              softWrap: true,
            ),
            trailing: IconButton(
              icon: const Icon(Icons.shopping_cart),
              color: Theme.of(context).accentColor,
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
