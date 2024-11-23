import 'package:flutter/foundation.dart';

class CardDetails extends ChangeNotifier {
  final String cardName;
  final String cardNumber;
  final double availableBalance;

  CardDetails({
    required this.cardName,
    required this.cardNumber,
    this.availableBalance = 140000,
  });

  static CardDetails demoCard = CardDetails(
    cardName: 'Unuefe Ejoke',
    cardNumber: 'xxxx xxxx xxxx 1234',
  );
}
