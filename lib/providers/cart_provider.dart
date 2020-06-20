import 'package:flutter/foundation.dart';

class CartItem {
  final String id, title;
  final int quantity;
  final double price;

  CartItem({
    @required this.title,
    @required this.price,
    this.quantity = 1,
    @required this.id,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemsCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, item) => total += item.price * item.quantity);
    return total;
  }

  void addItem(String productId, double price, String title) {
    // if (_items.containsKey(productId)) {
    //   _items.update(
    //       productId,
    //       (old) => CartItem(
    //             title: old.title,
    //             quantity: old.quantity + 1,
    //             id: old.id,
    //             price: old.price,
    //           ));
    // } else {
    //   _items.putIfAbsent(
    //       productId,
    //       () => CartItem(
    //             id: DateTime.now().toString(),
    //             title: title,
    //             price: price,
    //           ));
    // }
    // ifAbsent included in update
    _items.update(
        productId,
        (old) => CartItem(
              // update
              title: old.title,
              quantity: old.quantity + 1,
              id: old.id,
              price: old.price,
            ),
        ifAbsent: () => CartItem(
              //ifAbsent
              id: DateTime.now().toString(),
              title: title,
              price: price,
            ));
    notifyListeners();
  }
}
