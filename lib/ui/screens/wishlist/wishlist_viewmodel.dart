import 'package:flutter/material.dart';

class WishListViewModel extends ChangeNotifier {
  /// temporary just to mock UI
  bool hasWishList = false;
  bool hasWishListItem = false;

  void createWishList() {
    hasWishList = true;
    notifyListeners();
  }
  void createWishListItem() {
    hasWishListItem = true;
    notifyListeners();
  }
}
