import 'dart:ui';

import 'package:money_formatter/money_formatter.dart';

import 'product.dart';

enum OrderStatus { pending, delivered, cancelled }

class OrderModel {
  final String customerId;
  final String name;
  final String date;
  final String deliveryAddress;
  final String emailAddress;
  final int amount;
  final String contact;
  final OrderStatus status;
  final Product product;

  static List orders = [
    pendingOrderDemo,
    cancelledOrderDemo,
    deliveredOrderDemo
  ];

  OrderModel({
    this.customerId = '01ae466e-36c5-4349-96f6-77dc43ad',
    this.date = '12/06/2022',
    this.deliveryAddress = '2, Sonola Street, Aguda-Ogba',
    this.emailAddress = 'ligali@email.com',
    this.contact = '08064491812',
    this.name = 'Imam Ligali ',
    this.amount = 50000,
    required this.status,
    required this.product,
  });

  String getAmount() {
    return MoneyFormatter(
            amount: amount.toDouble(),
            settings: MoneyFormatterSettings(fractionDigits: 0))
        .output
        .nonSymbol;
  }

  Color get statusColor {
    switch (status) {
      case OrderStatus.pending:
        return const Color(0xFFFFB017);
      case OrderStatus.cancelled:
        return const Color(0xFFFF3D00);
      case OrderStatus.delivered:
        return const Color(0xFF4CAF50);
    }
  }

  static OrderModel pendingOrderDemo =
      OrderModel(status: OrderStatus.pending, product: orderDemoProduct);
  static OrderModel cancelledOrderDemo =
      OrderModel(status: OrderStatus.cancelled, product: orderDemoProduct);
  static OrderModel deliveredOrderDemo =
      OrderModel(status: OrderStatus.delivered, product: orderDemoProduct);

  static Product orderDemoProduct = Product(
      name: 'Addidas Snikers',
      price: 100000,
      availableSizes: [45],
      availableQuantity: 2,
      description: "A demo product for the order model");
}
