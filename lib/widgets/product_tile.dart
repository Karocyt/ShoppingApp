import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';
import '../screens/product_details_screen.dart';
import '../providers/cart_provider.dart';

class ProductTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // the whole widget will not rebuild at any change
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () => Navigator.of(context)
            .pushNamed(ProductDetailsScreen.route, arguments: product.id),
        child: GridTile(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
              color: Theme.of(context).accentColor,
              icon: Consumer<Product>(
                // child will not rebuild and can be used in builder
                child: null,
                // only part that listen to changes
                builder: (ctx, item, child) => item.isFavorite
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_border),
              ),
              onPressed: product.toggleFavorite,
            ),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
              softWrap: true,
            ),
            trailing: IconButton(
              icon: const Icon(Icons.shopping_cart),
              color: Theme.of(context).accentColor,
              onPressed: () {
                cart.addItem(product.id, product.price, product.title);
              },
            ),
          ),
        ),
      ),
    );
  }
}
