import 'package:flutter/foundation.dart';

import './product_provider.dart';

import '../products.dart';

class Products with ChangeNotifier {
  List<Product> _items = dummyProducts;
  
  // // Could be a global state management
  // var _favoriteOnly = false;

  // void toggleFavoritesFilter() {
  //   _favoriteOnly = !_favoriteOnly;
  //   notifyListeners();
  // }

  // set favoritesFilter(bool value) {
  //   _favoriteOnly = value;
  //   notifyListeners();
  // }

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favorites {
    return [..._items.where((item) => item.isFavorite)];
  }

  Product findById(String id) {
    return _items.firstWhere((item) => item.id == id);
  }

  void addProduct(value) {
    _items.add(value);
    notifyListeners();
  }
}
