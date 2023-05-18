import 'package:flutter/foundation.dart';
import 'package:flora/models/Flower.dart';

class FavoriteProvider with ChangeNotifier {
  final List<Flower> _favoriteItems = [];

  List<Flower> get favoriteItems => _favoriteItems;

  void addToFavorite(Flower flower) {
    _favoriteItems.add(flower);
    notifyListeners();
  }

  void removeFromFavorite(Flower flower) {
    _favoriteItems.remove(flower);
    notifyListeners();
  }

  void toggleFavorite(Flower flower) {
    if (favoriteItems.contains(flower)) {
      favoriteItems.remove(flower);
    } else {
      favoriteItems.add(flower);
    }

    notifyListeners();
  }

  void clearFavorites() {
    _favoriteItems.clear();
    notifyListeners();
  }
}
