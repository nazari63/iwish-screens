import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../../utils/i_wish_icons.dart';
import '../../../../utils/router/route_names.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/custom_app_bar.dart';

class TransferMoneyScreen extends StatelessWidget {
  const TransferMoneyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWithBackButton(),
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: heightSizer(12, context),
            horizontal: widthSizer(24, context)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Transfer Money', style: AppTextStyles.heading2(context)),
          SizedBox(height: heightSizer(12, context)),
          Text(
            'You can send money to an i-wish user or other banks using the options below',
            style: AppTextStyles.mediumBodyText(context)
                .copyWith(color: AppColors.textBlack),
          ),
          SizedBox(height: heightSizer(24, context)),
          _TransferMoneyOption(
            text: 'Send to an i-wish User',
            icon: IWishIcons.fluent_wallet_16_regular,
            onTap: () {
              Navigator.pushNamed(
                  context, RouteNames.transferToIWishUserScreen);
            },
          ),
          SizedBox(height: heightSizer(24, context)),
          _TransferMoneyOption(
            text: 'Withdraw to Bank Account',
            buttonColor: const Color(0xFFFFB017),
            icon: IWishIcons.fluent_building_bank_16_regular,
            onTap: () {

            },
          ),
        ]),
      ),
    );
  }
}

class _TransferMoneyOption extends StatelessWidget {
  const _TransferMoneyOption({
    Key? key,
    required this.onTap,
    this.buttonColor = AppColors.primaryColor,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final VoidCallback onTap;
  final Color buttonColor;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 24),
        height: heightSizer(54, context),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(width: widthSizer(15, context)),
            Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: widthSizer(16, context),
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
