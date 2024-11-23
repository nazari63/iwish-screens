import 'package:flutter/material.dart';
import 'package:wish_list/utils/router/route_names.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';
import '../../utils/i_wish_icons.dart';
import '../../utils/widget_size_utils.dart';
import 'custom_text_form_field.dart';
import 'divider_with_or.dart';
import 'general_button.dart';

class PaymentMethodForm extends StatefulWidget {
  const PaymentMethodForm({
    Key? key,
    required this.buttonText,
    required this.onFormSubmitted,
    this.forGrantWish = false,
  }) : super(key: key);

  final String buttonText;
  final void Function() onFormSubmitted;
  final bool forGrantWish;

  @override
  State<PaymentMethodForm> createState() => _PaymentMethodFormState();
}

class _PaymentMethodFormState extends State<PaymentMethodForm> {
  bool saveDetails = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Method',
            style: AppTextStyles.heading3(context),
          ),
          SizedBox(height: heightSizer(24, context)),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RouteNames.useMyWalletScreen);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 24),
              padding: const EdgeInsets.only(left: 24),
              height: heightSizer(54, context),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                      colors: [AppColors.primaryColor, Color(0xFFC80AFB)])),
              child: Row(
                children: [
                  const Icon(
                    IWishIcons.fluent_wallet_16_regular,
                    color: Colors.white,
                  ),
                  SizedBox(width: widthSizer(15, context)),
                  Text(
                    'Use My Wallet',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: widthSizer(16, context),
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: heightSizer(24, context)),
          Container(
            alignment: Alignment.centerLeft,
            width: widthSizer(303, context),
            padding: const EdgeInsets.only(left: 24),
            height: heightSizer(54, context),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFF3B7BBF)),
            child: Image.asset('assets/images/paystack-seeklogo.com.png'),
          ),
          SizedBox(height: heightSizer(24, context)),
          const DividerWithOr(),
          SizedBox(height: heightSizer(24, context)),
          const CustomTextFieldWithLabel(
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
            label: 'Cardholder Name',
            keyboardType: TextInputType.name,
          ),
          SizedBox(height: heightSizer(24, context)),
          const CustomTextFieldWithLabel(
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
            label: 'Card Number',
            hintText: '0000 0000 0000 0000',
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: heightSizer(24, context)),
          Row(
            children: [
              const Expanded(
                  child: CustomTextFieldWithLabel(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                label: 'Exp Date',
                hintText: '00/00',
                keyboardType: TextInputType.name,
              )),
              SizedBox(width: widthSizer(24, context)),
              const Expanded(
                  child: CustomTextFieldWithLabel(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                label: 'CVV',
                hintText: '123',
                keyboardType: TextInputType.number,
              ))
            ],
          ),
          SizedBox(height: heightSizer(48, context)),
          Visibility(
              visible: widget.forGrantWish,
              child: Column(
                children: [
                  SizedBox(
                    height: heightSizer(11, context),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        side: const BorderSide(
                            width: 1, color: AppColors.primaryColor),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        value: saveDetails,
                        onChanged: (value) {
                          setState(() {
                            saveDetails = value!;
                          });
                        },
                      ),
                      SizedBox(width: widthSizer(8, context)),
                      Text('Save information for future purchase',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: widthSizer(14, context),
                              color: const Color(0xFF333333))),
                    ],
                  ),
                  SizedBox(
                    height: heightSizer(24, context),
                  ),
                ],
              )),
          GeneralButton(
            textFontWeight: FontWeight.w400,
            textFontSize: widthSizer(16, context),
            buttonText: widget.buttonText,
            onPressed: () {
              widget.onFormSubmitted();
            },
          )
        ],
      ),
    );
  }
}
