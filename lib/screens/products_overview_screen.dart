import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import '../providers/cart_provider.dart';
import '../screens/cart_screen.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _favoritesOnly = false;

  @override
  Widget build(BuildContext context) {
    //final products = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                switch (selectedValue) {
                  case FilterOptions.Favorites:
                    {
                      _favoritesOnly = true;
                      break;
                    }
                  case FilterOptions.All:
                    {
                      _favoritesOnly = false;
                      break;
                    }
                }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: const Text('All products'),
                value: FilterOptions.All,
              ),
              PopupMenuItem(
                child: const Text('Favorites'),
                value: FilterOptions.Favorites,
              ),
            ],
          ),
          Consumer<Cart>(
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () => Navigator.of(context).pushNamed(CartScreen.route),
            ),
            builder: (_, cart, child) => Badge(
              child: child,
              value: cart.itemsCount.toString(),
            ),
          )
        ],
      ),
      body: ProductsGrid(_favoritesOnly),
    );
  }
}
