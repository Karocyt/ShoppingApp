import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/cart_item_card.dart';

class CartScreen extends StatelessWidget {
  static const String route = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Consumer<Cart>(
                    builder: (_, cart, __) => Chip(
                      label: Text(
                        '${cart.totalAmount.toString()} €',
                        style: TextStyle(
                          color: Theme.of(context).primaryTextTheme.title.color,
                        ),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  ),
                  FlatButton(
                    onPressed: null,
                    child: const Text('ORDER NOW'),
                    textColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Consumer<Cart>(
              builder: (_, cart, __) {
                final items = cart.items.values.toList();
                return ListView.builder(
                  itemBuilder: (ctx, i) => CartItemCard(
                    items[i].id,
                    items[i].title,
                    items[i].price,
                    items[i].quantity,
                  ),
                  itemCount: cart.itemsCount,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
