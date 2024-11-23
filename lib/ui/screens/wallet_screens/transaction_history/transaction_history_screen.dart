import 'package:flutter/material.dart';
import 'package:wish_list/ui/screens/wallet_screens/transaction_history/transaction_history_model.dart';
import 'package:wish_list/utils/widget_size_utils.dart';

import '../../../../utils/app_text_styles.dart';
import '../../../../utils/router/route_names.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_back_button.dart';
import '../../../widgets/drawer_menu.dart';
import '../../../widgets/transaction_tile.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerMenu(),
        backgroundColor: Colors.white,
        appBar: const AppBarWithActions(),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: heightSizer(12, context),
                horizontal: widthSizer(24, context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomBackButton(padding: EdgeInsets.zero),
                SizedBox(height: heightSizer(12, context)),
                Text(
                  'Transaction History',
                  style: AppTextStyles.heading3(context),
                ),
                SizedBox(height: heightSizer(24, context)),
                ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => TransactionTile(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RouteNames.transactionDetailsScreen,
                              arguments: TransactionModel.transactions[index],
                            );
                          },
                          transactionModel:
                              TransactionModel.transactions[index],
                        ),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: heightSizer(12, context)),
                    itemCount: TransactionModel.transactions.length)
              ],
            ),
          ),
        ));
  }
}

