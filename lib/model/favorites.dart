import 'package:flutter/foundation.dart';

class FavoritesModel extends ChangeNotifier {
  final List<int> _favoriteItemIds = [];

  List<int> get favoriteItemIds => _favoriteItemIds;

  void add(int itemId) {
    if (!_favoriteItemIds.contains(itemId)) {
      _favoriteItemIds.add(itemId);
      notifyListeners();
    }
  }

  void remove(int itemId) {
    if (_favoriteItemIds.contains(itemId)) {
      _favoriteItemIds.remove(itemId);
      notifyListeners();
    }
  }
}