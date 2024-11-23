import 'package:flutter/material.dart';
import 'package:wish_list/ui/screens/wallet_screens/transaction_history/transaction_history_model.dart';
import 'package:wish_list/utils/widget_size_utils.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_back_button.dart';
import '../../../widgets/details_item.dart';
import '../../../widgets/drawer_menu.dart';

class TransactionDetailsScreen extends StatelessWidget {
  final TransactionModel transactionModel;

  const TransactionDetailsScreen({
    Key? key,
    required this.transactionModel,
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
                  'Transaction Details',
                  style: AppTextStyles.heading3(context),
                ),
                SizedBox(height: heightSizer(24, context)),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: heightSizer(24, context)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.bgColor),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0xFFAEAEAE).withOpacity(0.15),
                            blurRadius: 20,
                            offset: const Offset(0, 8))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Money Transfer',
                          style: AppTextStyles.heading4(context),
                        ),
                      ),
                      SizedBox(height: heightSizer(32, context)),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: widthSizer(21, context)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '#${transactionModel.availableBalance()}',
                              style: AppTextStyles.heading3(context),
                            ),
                            SizedBox(height: heightSizer(6, context)),
                            Text(
                              transactionModel.name,
                              style: AppTextStyles.heading4(context),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: heightSizer(24, context)),
                      const Divider(color: AppColors.bgColor, height: 2),
                      SizedBox(height: heightSizer(24, context)),
                      DetailsItem(
                          title: transactionModel.modelType == ModelType.payment
                              ? 'To'
                              : 'From',
                          subTitle: transactionModel.toOrFrom),
                      SizedBox(height: heightSizer(24, context)),
                      DetailsItem(
                          title: 'Description',
                          subTitle: transactionModel.description),
                      SizedBox(height: heightSizer(24, context)),
                      DetailsItem(
                          title: 'Transaction ID',
                          subTitle: transactionModel.transactionId),
                      SizedBox(height: heightSizer(24, context)),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: widthSizer(21, context)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'More Actions',
                              style: AppTextStyles.mediumBodyText(context)
                                  .copyWith(color: AppColors.textGrey),
                            ),
                            SizedBox(height: heightSizer(6, context)),
                            Text(
                              'Report Transaction',
                              style: AppTextStyles.bodyText(context)
                                  .copyWith(color: AppColors.red),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}