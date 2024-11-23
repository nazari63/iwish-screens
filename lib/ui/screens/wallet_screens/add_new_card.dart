import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wish_list/ui/widgets/general_button.dart';
import 'package:wish_list/utils/credit_card_input_formatter.dart';
import 'package:wish_list/utils/validators.dart';

import '../../../utils/app_text_styles.dart';
import '../../../utils/router/route_names.dart';
import '../../../utils/widget_size_utils.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_text_form_field.dart';

class AddNewCardScreen extends StatelessWidget {
  const AddNewCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWithBackButton(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: widthSizer(24, context)),
        child: Form(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: heightSizer(19, context),
            ),
            Text(
              'Add New Card',
              style: AppTextStyles.heading2(context)
                  .copyWith(fontSize: widthSizer(24, context)),
            ),
            SizedBox(height: heightSizer(24, context)),
            const CustomTextFieldWithLabel(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12, vertical: 18),
              label: 'Cardholder Name',
              keyboardType: TextInputType.name,
              validator: Validators.isNotEmpty,
            ),
            SizedBox(height: heightSizer(24, context)),
            CustomTextFieldWithLabel(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
              label: 'Card Number',
              hintText: '0000 0000 0000 0000',
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(19),
                CardNumberInputFormatter()
              ],
            ),
            SizedBox(height: heightSizer(24, context)),
            Row(
              children: [
                Expanded(
                    child: CustomTextFieldWithLabel(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                  label: 'Exp Date',
                  hintText: '00 / 00',
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(4),
                    CardExpiryDateInputFormatter()
                  ],
                )),
                SizedBox(width: widthSizer(24, context)),
                Expanded(
                    child: CustomTextFieldWithLabel(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                  label: 'CVV',
                  hintText: '123',
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(3)
                  ],
                ))
              ],
            ),
            SizedBox(height: heightSizer(48, context)),
            GeneralButton(
              buttonText: 'Proceed',
              onPressed: () {
                Navigator.pushNamed(
                    context, RouteNames.setTransactionPinScreen);
              },
              textFontWeight: FontWeight.w400,
              textFontSize: widthSizer(16, context),
            )
          ]),
        ),
      ),
    );
  }
}
