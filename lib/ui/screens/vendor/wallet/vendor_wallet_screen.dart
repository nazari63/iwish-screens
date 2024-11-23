import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wish_list/ui/screens/wallet_screens/wallet_view_model.dart';
import 'package:wish_list/ui/widgets/general_button.dart';
import 'package:wish_list/utils/widget_size_utils.dart';

import '../../../../models/user.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../../utils/router/route_names.dart';
import '../../../../utils/service_locator.dart';
import '../../../widgets/bottom_nav.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/drawer_menu.dart';
import '../../../widgets/info_card.dart';
import '../../wallet_screens/components/wallet_action_buttons.dart';
import '../../wallet_screens/components/wallet_card.dart';

class VendorWalletScreen extends StatelessWidget {
  const VendorWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerMenu(),
        backgroundColor: Colors.white,
        appBar: const AppBarWithActions(),
        body: VendorBottomNav(
            currentNavParent: BottomNavParent.vendorWallet,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                  vertical: heightSizer(24, context),
                  horizontal: widthSizer(24, context)),
              child: ChangeNotifierProvider<WalletViewModel>.value(
                  value: serviceLocator<WalletViewModel>(),
                  child: Consumer<WalletViewModel>(
                      builder: (context, viewModel, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Wallet',
                              style: AppTextStyles.heading2(context),
                            ),
                            GeneralButton(
                              buttonText: 'View Profile',
                              onPressed: () {},
                              textFontSize: widthSizer(16, context),
                              textFontWeight: FontWeight.w400,
                              width: widthSizer(140, context),
                              height: heightSizer(48, context),
                            )
                          ],
                        ),
                        SizedBox(height: heightSizer(24, context)),
                        WalletCardWithBalance(
                          availableBalance: Wisher.demoWisher1.availableBalance,
                        ),
                        SizedBox(height: heightSizer(24, context)),
                        const WalletActionButtons(forVendor: true),
                        SizedBox(height: heightSizer(24, context)),
                        Visibility(
                            visible: !WalletViewModel.hasSetTransactionPin,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Required Action',
                                  style: AppTextStyles.heading3(context)
                                      .copyWith(fontSize: 16),
                                ),
                                SizedBox(height: heightSizer(12, context)),
                                InfoCard(
                                  title: 'Set a transaction PIN',
                                  details:
                                      'Setup your transaction pin to start sending and receiving money through your wallet',
                                  onTap: () {
                                    Navigator.pushNamed(context,
                                        RouteNames.setTransactionPinScreen);
                                  },
                                ),
                              ],
                            )),
                      ],
                    );
                  })),
            )));
  }
}
