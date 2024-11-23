import 'package:flutter/material.dart';
import 'package:wish_list/ui/widgets/general_button.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../../utils/i_wish_icons.dart';
import '../../../../utils/router/route_names.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/credit_card.dart';

class PaymentSuccessfulDialog extends StatelessWidget {
  final bool forGiftBox;

  static show(BuildContext context) {
    showDialog(
        context: context,
        barrierColor: Colors.white70,
        barrierDismissible: false,
        builder: (context) {
          return const PaymentSuccessfulDialog._();
        });
  }

  const PaymentSuccessfulDialog._({Key? key, this.forGiftBox = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.white70,
      insetPadding: EdgeInsets.all(widthSizer(24, context)),
      child: Container(
        width: widthSizer(327, context),
        height: heightSizer(508, context),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widthSizer(8, context)),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Color(0x26AEAEAE),
                  blurRadius: 20,
                  offset: Offset(0, -8)),
              BoxShadow(
                  color: Color(0x26AEAEAE),
                  blurRadius: 20,
                  offset: Offset(0, 8))
            ]),
        child: Stack(children: [
          Positioned(
              bottom: 0,
              child: Container(
                  width: widthSizer(327, context),
                  height: heightSizer(150, context),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8)),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                              'assets/images/purple_and_yellow_bg_design_with_purple_lines.png'))))),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: forGiftBox,
                  replacement: const Icon(
                    IWishIcons.fluent_arrow_sync_checkmark_20_filled,
                    color: AppColors.green,
                    size: 60,
                  ),
                  child: Image.asset(
                      'assets/images/order_successful_dialog_image.png'),
                ),
                SizedBox(height: heightSizer(17, context)),
                Text(
                  'Order Successful',
                  style: AppTextStyles.heading3(context),
                ),
                Text(
                  'Thank you for shopping on i-Wish. Your \norder has been confirmed and packaged.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.mediumBodyText(context)
                      .copyWith(color: const Color(0xFF333333)),
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
                            'Amount Payed ',
                            style: TextStyle(
                                fontSize: widthSizer(16, context),
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            '#105,000',
                            style: TextStyle(
                                color: const Color(0xFF333333),
                                fontSize: widthSizer(14, context),
                                fontWeight: FontWeight.w400),
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
                            style: TextStyle(
                                color: const Color(0xFF333333),
                                fontSize: widthSizer(14, context),
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: heightSizer(20, context)),
                const CreditCardCutOut(),
                SizedBox(height: heightSizer(28, context)),
                GeneralButton(
                  buttonText: 'View Details',
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, RouteNames.orderDetails);
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
