import 'package:money_formatter/money_formatter.dart';

class WishListItem {
  final String name;
  final double price;
  final String imageUrl;
  final bool isGranted;
  final String category;

  WishListItem(
      {required this.name,
      required this.price,
      required this.category,
      this.isGranted = false,
      this.imageUrl = 'https://picsum.photos/200'});

  String get priceString => MoneyFormatter(
          amount: price.toDouble(),
          settings: MoneyFormatterSettings(fractionDigits: 0))
      .output
      .nonSymbol;

  static final List<WishListItem> demoItems = [
    WishListItem(name: 'Nike Air Max 720', price: 100000, category: 'Shoes'),
    WishListItem(
        name: 'Stripe Versace jump',
        price: 80000,
        isGranted: true,
        category: 'Shoes'),
    WishListItem(
        name: 'Adiddas Air Max',
        price: 50000,
        isGranted: true,
        category: 'Shoes'),
    WishListItem(
        name: 'Versace Perfume Oil', price: 100000, category: 'Travels'),
    WishListItem(
        name: 'Chanel Cosmetic Pack', price: 80000, category: 'Travels'),
    WishListItem(
        name: 'Chris Rivela Perfume',
        price: 100000,
        isGranted: true,
        category: 'Travels'),
    WishListItem(name: 'Prada Miland Bag', price: 80000, category: 'Bags'),
    WishListItem(
        name: 'Prada Miland Bag',
        price: 20000,
        isGranted: true,
        category: 'Travels'),
    WishListItem(name: 'Bone Straight', price: 50000, category: 'Clothings'),
    WishListItem(
        name: 'IPhone', price: 200000, isGranted: true, category: 'Gadgets'),
    WishListItem(
        name: 'Sony Playstation', price: 50000, category: 'Electronics'),
    WishListItem(name: 'Red Nike Sneaker', price: 100000, category: 'Shoes'),
  ];
}
