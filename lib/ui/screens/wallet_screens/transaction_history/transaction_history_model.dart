import 'package:money_formatter/money_formatter.dart';

enum ModelType { payment, receipt }

class TransactionModel {
  final String name;
  final int amount;
  final String toOrFrom;
  final String description;
  final String transactionId;
  final ModelType modelType;

  static List transactions = [demoOne, demoTwo, demoThree];

  TransactionModel(
      {required this.name,
      required this.amount,
      this.toOrFrom = 'i-wish wallet',
      this.description = '',
      this.transactionId = '365893643033RN',
      required this.modelType});

  String availableBalance() {
    return MoneyFormatter(
      amount: amount.toDouble(),
      settings: MoneyFormatterSettings(fractionDigits: 0)
    ).output.nonSymbol;
  }

  static TransactionModel demoOne = TransactionModel(
      name: 'Rochas Okorocha',
      amount: 5000,
      description: 'Sent money to Wallet',
      modelType: ModelType.payment);
  static TransactionModel demoTwo = TransactionModel(
      name: 'Mateen Gbadamosi',
      amount: 16000,
      description: 'Wallet Funding',
      modelType: ModelType.receipt);
  static TransactionModel demoThree = TransactionModel(
      name: 'Unuefe Ejoke',
      amount: 20000,
      description: 'Received money',
      modelType: ModelType.receipt);

  static TransactionModel demoFour = TransactionModel(
      name: 'Mateen Gbadamosi',
      amount: 16000,
      description: 'Wallet Transfer',
      modelType: ModelType.receipt);
}
