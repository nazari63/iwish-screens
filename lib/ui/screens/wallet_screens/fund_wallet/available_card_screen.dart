import 'package:flutter/material.dart';
import 'package:wish_list/ui/screens/wallet_screens/components/add_new_card_button.dart';
import 'package:wish_list/ui/screens/wallet_screens/wallet_view_model.dart';
import 'package:wish_list/utils/widget_size_utils.dart';

import '../../../../utils/app_text_styles.dart';
import '../../../../utils/router/route_names.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/drawer_menu.dart';
import '../components/wallet_card.dart';

class AvailableCardScreen extends StatelessWidget {
  const AvailableCardScreen({Key? key}) : super(key: key);

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
                SizedBox(height: heightSizer(24, context)),
                Text(
                  'Fund Wallet',
                  style: AppTextStyles.heading2(context),
                ),
                SizedBox(height: heightSizer(24, context)),
                Text(
                  'Using Debit Card',
                  style: AppTextStyles.heading4(context),
                ),
                SizedBox(height: heightSizer(24, context)),
                ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => UserCreditCard(
                          buttonText: 'Select Card',
                          card: WalletViewModel.availableCards[index],
                          onButtonPressed: () {
                            Navigator.pushNamed(
                                context, RouteNames.enterFundWalletAmountScreen,
                                arguments:
                                    WalletViewModel.availableCards[index]);
                          },
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          height: heightSizer(24, context),
                        ),
                    itemCount: WalletViewModel.availableCards.length),
                SizedBox(height: heightSizer(48, context)),
                const AddNewCardButton(),
              ],
            ),
          ),
        ));
  }
}
