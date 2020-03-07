import 'package:flutter/foundation.dart';

import './product_provider.dart';

import '../products.dart';

class Products with ChangeNotifier {
  List<Product> _items = dummyProducts;

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((item) => item.id == id);
  }

  void addProduct(value) {
    _items.add(value);
    notifyListeners();
  }
}
