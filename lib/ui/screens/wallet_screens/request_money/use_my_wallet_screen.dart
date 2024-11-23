import 'package:flutter/material.dart';
import 'package:wish_list/ui/screens/wallet_screens/components/wallet_card.dart';
import 'package:wish_list/ui/widgets/general_button.dart';

import '../../../../models/user.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/custom_app_bar.dart';
import '../components/grant_request_successful_dialog.dart';

class UseMyWalletScreen extends StatelessWidget {
  const UseMyWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWithBackButton(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: widthSizer(24, context)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: heightSizer(10, context)),
          Text('Grant Request', style: AppTextStyles.heading2(context)),
          SizedBox(height: heightSizer(28, context)),
          Text(
            'Use my Wallet',
            style: AppTextStyles.heading3(context),
          ),
          SizedBox(height: heightSizer(24, context)),
          FundWalletCard(availableBalance: Wisher.demoWisher1.availableBalance),
          SizedBox(height: heightSizer(63, context)),
          GeneralButton(
            textFontWeight: FontWeight.w400,
            textFontSize: widthSizer(16, context),
            buttonText: 'Pay NGN500.00',
            onPressed: () {
              GrantRequestSuccessfulDialog.show(context,
                  paymentType: GrantRequestPaymentType.wallet);
            },
          ),
        ]),
      ),
    );
  }
}
