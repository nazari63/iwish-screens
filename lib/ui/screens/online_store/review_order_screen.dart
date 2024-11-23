import 'package:flutter/material.dart';
import 'package:wish_list/ui/screens/online_store/components/cart_items_list.dart';
import 'package:wish_list/ui/widgets/product_details_section.dart';
import 'package:wish_list/ui/widgets/custom_app_bar.dart';
import 'package:wish_list/ui/widgets/general_button.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../../../utils/widget_size_utils.dart';
import '../../widgets/credit_card.dart';
import 'components/payment_successful_dialog.dart';

class ReviewOrderScreen extends StatelessWidget {
  const ReviewOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWithBackButton(
        leadingWidth: widthSizer(100, context),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(widthSizer(24, context)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Review Order',
            style: AppTextStyles.heading2(context),
          ),
          SizedBox(height: heightSizer(24, context)),
          const CartItemsList(),
          SizedBox(height: heightSizer(48, context)),
          _DetailsCard(
              title: 'Address Details',
              buttonText: 'Change Address',
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                child: Text(
                  'NO.35, Zone A, Alaka street, Obafemi Awolowo Way, Ikeja, Lagos',
                  style: TextStyle(
                      color: const Color(0xFF333333),
                      fontWeight: FontWeight.w400,
                      fontSize: widthSizer(14, context)),
                ),
              )),
          SizedBox(height: heightSizer(24, context)),
          _DetailsCard(
              title: 'Delivery Method',
              buttonText: 'Change Method',
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pickup Station',
                      style: TextStyle(
                          color: const Color(0xFF333333),
                          fontWeight: FontWeight.w600,
                          fontSize: widthSizer(16, context)),
                    ),
                    SizedBox(height: heightSizer(6, context)),
                    Text(
                      'Victoria Island - Station\nPlot PC. 23, Engineering Close',
                      style: TextStyle(
                          color: const Color(0xFF333333),
                          fontWeight: FontWeight.w400,
                          fontSize: widthSizer(14, context)),
                    )
                  ],
                ),
              )),
          SizedBox(height: heightSizer(24, context)),
          const _DetailsCard(
              title: 'Payment Method',
              buttonText: 'Change',
              child: CreditCardCutOut()),
          SizedBox(height: heightSizer(24, context)),
          Text(
            'Estimated Delivery Day',
            style: AppTextStyles.heading4(context),
          ),
          SizedBox(height: heightSizer(12, context)),
          Text('Your order is estimated to arrive in 5 working days',
              style: AppTextStyles.mediumBodyText(context)
                  .copyWith(color: AppColors.textBlack)),
          SizedBox(height: heightSizer(48, context)),
          const ProductDetailsSection(),
          SizedBox(height: heightSizer(48, context)),
          GeneralButton(
              textFontSize: widthSizer(16, context),
              textFontWeight: FontWeight.w400,
              buttonText: 'Make Payment',
              onPressed: () {
                PaymentSuccessfulDialog.show(context);
              }),
          SizedBox(height: heightSizer(20, context)),
        ]),
      ),
    );
  }
}

class _DetailsCard extends StatelessWidget {
  final String title;

  final String buttonText;

  final Widget child;

  const _DetailsCard(
      {Key? key,
      required this.title,
      required this.buttonText,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: heightSizer(19, context)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              color: const Color(0xFFAEAEAE).withOpacity(.15),
              blurRadius: 20,
              offset: const Offset(0, 8))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: AppTextStyles.heading4(context)),
                Text(buttonText,
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: widthSizer(14, context))),
              ],
            ),
          ),
          const Divider(
            indent: 1,
            endIndent: 1.5,
            color: Color(0xFFE5E0E9),
            thickness: 1,
            // height: 2,
          ),
          child
        ],
      ),
    );
  }
}
