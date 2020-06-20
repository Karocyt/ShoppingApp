import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  final String id, title;
  final double price;
  final int quantity;

  CartItemCard(this.id, this.title, this.price, this.quantity);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            child: Text(
              '$price €',
            ),
          ),
          title: Text(title),
          subtitle: Text('Total: ${price * quantity} €'),
          trailing: Text('${quantity}x'),
        ),
      ),
    );
  }
}
