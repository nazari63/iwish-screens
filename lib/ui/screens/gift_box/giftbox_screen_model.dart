import 'package:flutter/material.dart';

import '../../../models/wish_list_items.dart';

class GiftBoxScreenViewModel extends ChangeNotifier {
  static int selectedTag = 0;

  static List<String> filterTags = [
    'Shoes',
    'Gadgets',
    'Travels',
    'Bags',
    'Electronics',
    'Shoes',
    'Gadgets',
    'Travels',
    'Bags',
    'Electronics',
  ];

  void makeActive(index) {
    selectedTag = index;
    notifyListeners();
    demoGiftBoxes = WishListItem.demoItems;
  }

  static List<WishListItem> demoGiftBoxes = WishListItem.demoItems;
}
