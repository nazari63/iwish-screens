import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wish_list/ui/screens/wallet_screens/components/add_new_card_button.dart';
import 'package:wish_list/ui/screens/wallet_screens/components/wallet_card.dart';
import 'package:wish_list/ui/screens/wallet_screens/wallet_view_model.dart';
import 'package:wish_list/utils/widget_size_utils.dart';

import '../../../models/card_details.dart';
import '../../../utils/app_text_styles.dart';
import '../../../utils/service_locator.dart';
import '../../widgets/bottom_nav.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/drawer_menu.dart';

class ManageCardsScreen extends StatelessWidget {
  const ManageCardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerMenu(),
        backgroundColor: Colors.white,
        appBar: const AppBarWithActions(),
        body: WisherBottomNav(
            currentNavParent: BottomNavParent.wallet,
            child: SingleChildScrollView(
              padding:
                  EdgeInsets.symmetric(horizontal: widthSizer(24, context)),
              child: ChangeNotifierProvider<WalletViewModel>.value(
                  value: serviceLocator<WalletViewModel>(),
                  child: Consumer<WalletViewModel>(
                      builder: (context, viewModel, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: heightSizer(24, context)),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Manage Cards',
                            textAlign: TextAlign.start,
                            style: AppTextStyles.heading2(context),
                          ),
                        ),
                        SizedBox(height: heightSizer(24, context)),
                        ListView.separated(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return UserCreditCard(
                                  card: CardDetails.demoCard,
                                  buttonText: 'Remove Card',
                                  onButtonPressed: () {});
                            },
                            separatorBuilder: (context, index) =>
                                SizedBox(height: heightSizer(24, context)),
                            itemCount: 2),
                        SizedBox(height: heightSizer(48, context)),
                        const AddNewCardButton()
                      ],
                    );
                  })),
            )));
  }
}
