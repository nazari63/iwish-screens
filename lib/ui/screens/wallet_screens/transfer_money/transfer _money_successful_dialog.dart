import 'package:flutter/material.dart';
import 'package:wish_list/ui/widgets/general_button.dart';
import 'package:wish_list/utils/app_colors.dart';

import '../../../../utils/app_text_styles.dart';
import '../../../../utils/i_wish_icons.dart';
import '../../../../utils/router/route_names.dart';
import '../../../../utils/widget_size_utils.dart';

class TransferMoneySuccessfulDialog extends StatelessWidget {
  static show(
    BuildContext context,
  ) {
    showDialog(
        context: context,
        barrierColor: Colors.white70,
        barrierDismissible: false,
        builder: (context) {
          return const TransferMoneySuccessfulDialog._();
        });
  }

  const TransferMoneySuccessfulDialog._({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 2,
      backgroundColor: Colors.white70,
      insetPadding: EdgeInsets.all(widthSizer(24, context)),
      child: Container(
        width: widthSizer(327, context),
        height: heightSizer(431, context),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widthSizer(8, context)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: const Color(0xFFAEAEAE).withOpacity(0.15),
                  blurRadius: 20,
                  offset: const Offset(0, 8))
            ]),
        child: Stack(children: [
          Positioned(
              bottom: 0,
              child: Container(
                  width: widthSizer(327, context),
                  height: heightSizer(150, context),
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(8)),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                              'assets/images/grant_request_with_wallet_dialog_bg_design.png'))))),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  IWishIcons.fluent_arrow_sync_checkmark_20_filled,
                  color: AppColors.green,
                  size: widthSizer(50, context),
                ),
                SizedBox(height: heightSizer(12, context)),
                Text(
                  'Payment Successful',
                  style: AppTextStyles.heading3(context),
                ),
                SizedBox(height: heightSizer(12, context)),
                Text(
                  'You’ve successfully sent money to Unuefe \nEjoke using your wallet',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.mediumBodyText(context)
                      .copyWith(color: AppColors.textBlack),
                ),
                SizedBox(height: heightSizer(24, context)),
                const Divider(
                  color: Color(0xFFE5E0E9),
                  thickness: 1,
                  height: 2,
                ),
                SizedBox(height: heightSizer(24, context)),
                Padding(
                  padding: const EdgeInsets.only(left: 26.0, right: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Amount Sent ',
                            style: TextStyle(
                                fontSize: widthSizer(16, context),
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            '#500',
                            style: AppTextStyles.mediumBodyText(context)
                                .copyWith(color: AppColors.textBlack),
                          ),
                        ],
                      ),
                      SizedBox(height: heightSizer(12, context)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Ref No.',
                            style: TextStyle(
                                fontSize: widthSizer(16, context),
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            '365893643033RN',
                            style: AppTextStyles.mediumBodyText(context)
                                .copyWith(color: AppColors.textBlack),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: heightSizer(48, context)),
                GeneralButton(
                  buttonText: 'Done',
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.popUntil(context,
                        ModalRoute.withName(RouteNames.transferMoneyScreen));
                    Navigator.pop(context);
                  },
                  width: widthSizer(140, context),
                  height: heightSizer(48, context),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
