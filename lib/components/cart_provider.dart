import 'package:flutter/foundation.dart';
import 'package:flora/models/Flower.dart';

class CartProvider extends ChangeNotifier {
  List<Flower> cartItems = [];

  void addToCart(Flower flower) {
    cartItems.add(flower);
    notifyListeners();
  }

  void removeFromCart(Flower flower) {
    cartItems.remove(flower);
    notifyListeners();
  }

  void clearFavorites() {
    cartItems.clear();
    notifyListeners();
  }
}

