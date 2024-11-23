import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';

import 'card_details.dart';

class User extends ChangeNotifier {
  final String name;
  final String email;
  final String mobileNumber;
  final CardDetails? userCardDetails;
  bool hasRegisteredBVN = false;

  registerBVN() {
    hasRegisteredBVN = true;
    notifyListeners();
  }

  static List<User> friends = [
    Wisher.demoWisher1,
    Wisher.demoUser2,
    Wisher.demoWisher1,
    Wisher.demoUser2,
    Wisher.demoWisher1,
    Wisher.demoUser2,
    Wisher.demoWisher1,
  ];
  String get availableBalance => MoneyFormatter(
          amount: userCardDetails!.availableBalance.toDouble(),
          settings: MoneyFormatterSettings(fractionDigits: 0))
      .output
      .nonSymbol;

  User({
    required this.name,
    required this.email,
    required this.mobileNumber,
    required this.userCardDetails,
  });
}

class Wisher extends User {
  final String billingAddress;
  Wisher({
    required super.name,
    required super.email,
    required super.mobileNumber,
    required this.billingAddress,
    required super.userCardDetails,
  });

  static Wisher demoWisher1 = Wisher(
    name: 'Unuefe Ejoke',
    email: 'example@email.com',
    mobileNumber: '+234 701 234 5678',
    billingAddress: '19 ltamaga Housing Estate, Ikorodu',
    userCardDetails: CardDetails.demoCard,
  );

  static Wisher demoUser2 = Wisher(
    name: 'Ifunanya Aremu',
    email: 'example@email.com',
    mobileNumber: '+234 701 234 5678',
    billingAddress: '19 ltamaga Housing Estate, Ikorodu',
    userCardDetails: CardDetails.demoCard,
  );
}

class Vendor extends User {
  Vendor(
      {required super.name,
      required super.email,
      required super.mobileNumber,
      required super.userCardDetails});

  bool hasBusinessDetails = false;

  registerBusinessDetails() {
    hasBusinessDetails = true;
    notifyListeners();
  }

  static Vendor demoVendor = Vendor(
    name: 'Rianat Ajoke',
    email: 'example@email.com',
    mobileNumber: '+234 701 234 5678',
    userCardDetails: CardDetails.demoCard,
  );
}
