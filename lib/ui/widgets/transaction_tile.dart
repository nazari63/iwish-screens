import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';
import '../../utils/i_wish_icons.dart';
import '../../utils/widget_size_utils.dart';
import '../screens/wallet_screens/transaction_history/transaction_history_model.dart';
import 'icon_container.dart';

class TransactionTile extends StatelessWidget {
  final TransactionModel transactionModel;
  final VoidCallback onTap;

  const TransactionTile(
      {Key? key, required this.transactionModel, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: widthSizer(10, context),
            vertical: heightSizer(8, context)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFFF2E8FF)),
        child: Row(
          children: [
            IconContainer(
              width: widthSizer(31.5, context),
              backgroundColor: AppColors.lightPurple,
              child: const Icon(
                IWishIcons.fluent_send_24_regular,
                color: Colors.white,
              ),
            ),
            SizedBox(width: widthSizer(6, context)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transactionModel.name,
                  style: AppTextStyles.mediumBodyText(context),
                ),
                SizedBox(height: heightSizer(6, context)),
                Text(transactionModel.description,
                    style: AppTextStyles.smallBodyText(context)
                        .copyWith(color: AppColors.textGrey)),
              ],
            ),
            const Spacer(),
            Text('#${transactionModel.availableBalance()}',
                style: AppTextStyles.smallBodyText(context).copyWith(
                    color: transactionModel.modelType == ModelType.payment
                        ? AppColors.red
                        : Colors.black)),
          ],
        ),
      ),
    );
  }
}
