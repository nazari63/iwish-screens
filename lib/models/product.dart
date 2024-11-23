import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';

class Product extends ChangeNotifier {
  final String name;
  final int price;
  final int availableQuantity;
  final String description;
  final List availableSizes;
  final List productImages;
  final List availableColors;
  final bool isAvailable;

  int cartQuantity = 1;

  Product(
      {this.isAvailable = true,
      required this.name,
      required this.price,
      this.availableQuantity = 10,
      required this.description,
      this.availableColors = const ['White', 'Blue', 'Red', 'Coral Green'],
      this.availableSizes = const ['38', '39', '40', '42'],
      this.productImages = const [
        'https://picsum.photos/300',
        'https://picsum.photos/250',
        'https://picsum.photos/400'
      ]});
  List<double> percentage = [0.1, 0.2, 0.5, 0.7, 1];
  String get priceString => MoneyFormatter(
          amount: price.toDouble(),
          settings: MoneyFormatterSettings(fractionDigits: 0))
      .output
      .nonSymbol;

  String get totalPriceString => MoneyFormatter(
          amount: price * cartQuantity.toDouble(),
          settings: MoneyFormatterSettings(fractionDigits: 0))
      .output
      .nonSymbol;

  void increaseCartQuantity() {
    if (cartQuantity < availableQuantity) {
      cartQuantity++;
      notifyListeners();
    }
  }

  void decreaseCartQuantity() {
    if (cartQuantity > 0) {
      cartQuantity--;
      notifyListeners();
    }
  }

  static List grantWishDemoItems = [
    Product.sonyPlayStation,
    Product.nonAvailableSonyPlayStation,
    Product.psGamingPad
  ];

  static List<Product> cart = [nikeAirMax, greenNikeAirMax];

  /// Demo Products
  static Product nikeAirMax = Product(
      name: 'Nike Air Max 720',
      price: 100000,
      description:
          "The shoes had been there for as long as anyone could remember. "
          "In fact, it was difficult for anyone to come up with a date they had first "
          "appeared. It had seemed they'd always been there and yet they seemed so "
          "out of place.");

  static Product greenNikeAirMax = Product(
      name: 'Nike Air Max 720',
      price: 100000,
      description:
          "The shoes had been there for as long as anyone could remember. "
          "In fact, it was difficult for anyone to come up with a date they had first "
          "appeared. It had seemed they'd always been there and yet they seemed so "
          "out of place.");

  static Product sonyPlayStation = Product(
      name: 'Sony Playstation 5',
      price: 100000,
      description:
          "The shoes had been there for as long as anyone could remember. In fact, it was difficult for anyone to come up with a date they had first appeared. It had seemed they'd always been there and yet they seemed so out of place.");
  static Product nonAvailableSonyPlayStation = Product(
      name: 'Sony Playstation 5',
      isAvailable: false,
      price: 100000,
      description:'');
  static Product psGamingPad = Product(
      name: 'ps5 gaming pad',
      price: 100000,
      description:
          "The shoes had been there for as long as anyone could remember. In fact, it was difficult for anyone to come up with a date they had first appeared. It had seemed they'd always been there and yet they seemed so out of place.");
}
