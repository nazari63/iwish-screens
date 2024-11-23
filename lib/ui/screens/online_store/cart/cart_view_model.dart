import 'package:flutter/material.dart';

import '../../../../utils/router/route_names.dart';

class CartViewModel extends ChangeNotifier {
  /// temporary just to mock UI
  bool hasItemInCart = false;

  void addToCart(context) {
    hasItemInCart = true;
    Navigator.pushNamed(context, RouteNames.cartScreen);
    notifyListeners();
  }
}
