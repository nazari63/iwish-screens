import 'package:flutter/material.dart';

import '../../../models/card_details.dart';

class WalletViewModel extends ChangeNotifier {
  static bool hasCard = false;
  static bool hasRegisteredBVN = false;
  static bool hasSetTransactionPin = false;

  addCard() {
    hasCard = true;
    hasSetTransactionPin = true;
    notifyListeners();
  }

  setTransactionPin() {
    hasSetTransactionPin = true;
    notifyListeners();
  }

  registerBVN() {
    hasRegisteredBVN = true;
    notifyListeners();
  }

  static List<CardDetails> availableCards = [CardDetails.demoCard];
}
