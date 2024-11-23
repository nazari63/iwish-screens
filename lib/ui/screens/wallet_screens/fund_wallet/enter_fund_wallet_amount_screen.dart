import 'package:flutter/material.dart';
import 'package:wish_list/ui/widgets/general_button.dart';
import 'package:wish_list/utils/widget_size_utils.dart';

import '../../../../models/card_details.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../../utils/router/route_names.dart';
import '../../../widgets/amount_selector.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_back_button.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/drawer_menu.dart';
import '../components/wallet_card.dart';

class EnterFundWalletAmountScreen extends StatelessWidget {
  final CardDetails selectedCard;
  const EnterFundWalletAmountScreen({Key? key, required this.selectedCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerMenu(),
        backgroundColor: Colors.white,
        appBar: const AppBarWithActions(),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: widthSizer(24, context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: heightSizer(12, context)),
                const CustomBackButton(padding: EdgeInsets.zero),
                SizedBox(height: heightSizer(12, context)),
                Text(
                  'Fund Wallet',
                  style: AppTextStyles.heading2(context),
                ),
                SizedBox(height: heightSizer(24, context)),
                Text(
                  'Using Card',
                  style: AppTextStyles.heading4(context),
                ),
                SizedBox(height: heightSizer(12, context)),
                SelectedWalletCard(card: selectedCard),
                SizedBox(height: heightSizer(32, context)),
                AmountSelector(
                  label: 'How much do you want to receive?',
                  onAmountChanged: (_) {},
                ),
                SizedBox(height: heightSizer(24, context)),
                const CustomTextFieldWithLabel(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                  label: 'Description (Optional)',
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: heightSizer(48, context)),
                GeneralButton(
                  buttonText: 'Fund Wallet',
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, RouteNames.enterTransactionPinScreen);
                  },
                  textFontSize: widthSizer(16, context),
                  textFontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
        ));
  }
}
