import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wish_list/ui/screens/wallet_screens/wallet_view_model.dart';
import 'package:wish_list/ui/widgets/general_button.dart';
import 'package:wish_list/utils/app_colors.dart';
import 'package:wish_list/utils/widget_size_utils.dart';

import '../../../models/user.dart';
import '../../../utils/app_text_styles.dart';
import '../../../utils/router/route_names.dart';
import '../../../utils/service_locator.dart';
import '../../widgets/bottom_nav.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/drawer_menu.dart';
import '../../widgets/info_card.dart';
import 'components/add_new_card_button.dart';
import 'components/wallet_action_buttons.dart';
import 'components/wallet_card.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

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
                        const WalletActionButtons(),
                        SizedBox(height: heightSizer(24, context)),
                        Visibility(
                            visible: WalletViewModel.hasRegisteredBVN,
                            replacement: InfoCard(
                              title: 'BVN Verification',
                              details:
                                  'Your BVN verification is required before\n any transaction can be done.',
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteNames.bvnVerificationScreen);
                              },
                            ),
                            child: const SizedBox()),
                        SizedBox(height: heightSizer(24, context)),
                        Visibility(
                            visible: WalletViewModel.hasRegisteredBVN,
                            replacement: InfoCard(
                              title: 'Add Account Number',
                              details:
                                  'Add your account number in order to be able to transfer money into your bank account',
                              onTap: () {},
                            ),
                            child: const SizedBox()),
                        SizedBox(height: heightSizer(24, context)),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Card Information',
                            style: AppTextStyles.heading3(context),
                          ),
                        ),
                        Visibility(
                            visible: WalletViewModel.hasCard,
                            replacement: const _HasNoCardView(),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RouteNames.manageCardsScreen);
                                },
                                child: Text(
                                  'Manage my cards',
                                  style: TextStyle(
                                      fontSize: widthSizer(16, context),
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.primaryColor),
                                ),
                              ),
                            )),
                        SizedBox(
                            height: heightSizer(
                                WalletViewModel.hasCard ? 48 : 12, context)),
                        const AddNewCardButton(),
                        SizedBox(height: heightSizer(30, context)),
                      ],
                    );
                  })),
            )));
  }
}

// class _HasCardView extends StatelessWidget {
//   const _HasCardView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(height: heightSizer(12, context)),
//         Container(
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               color: const Color(0xFFE5E0E9)),
//           padding: EdgeInsets.symmetric(
//               vertical: heightSizer(23, context),
//               horizontal: widthSizer(8, context)),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Card Name',
//                       style: AppTextStyles.heading1(context)
//                           .copyWith(fontSize: widthSizer(16, context))),
//                   Text('Unuefe Ejoke',
//                       style: AppTextStyles.mediumBodyText(context)
//                           .copyWith(color: AppColors.textBlack)),
//                 ],
//               ),
//               SizedBox(height: heightSizer(12, context)),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Card Number',
//                       style: AppTextStyles.heading1(context)
//                           .copyWith(fontSize: widthSizer(16, context))),
//                   Text('xxxx xxxx xxxx 1234',
//                       style: AppTextStyles.mediumBodyText(context)
//                           .copyWith(color: const Color(0xFF333333)))
//                 ],
//               )
//             ],
//           ),
//         ),
//         SizedBox(height: heightSizer(12, context)),
//         SizedBox(height: heightSizer(12, context)),
//         Align(
//           alignment: Alignment.center,
//           child: GeneralButton(
//             borderColor: AppColors.primaryColor,
//             buttonColor: Colors.white,
//             textColor: AppColors.primaryColor,
//             buttonText: 'Edit Card Details',
//             onPressed: () {},
//             textFontSize: widthSizer(16, context),
//             textFontWeight: FontWeight.w700,
//             width: widthSizer(164, context),
//             height: heightSizer(48, context),
//           ),
//         ),
//       ],
//     );
//   }
// }

class _HasNoCardView extends StatelessWidget {
  const _HasNoCardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Image.asset('assets/images/debit-blue-card.png',
              fit: BoxFit.scaleDown),
          SizedBox(height: heightSizer(12, context)),
          Text(
            'No card has been added yet',
            style: AppTextStyles.mediumBodyText(context)
                .copyWith(color: AppColors.textBlack),
          ),
        ],
      ),
    );
  }
}
