import 'package:flutter/material.dart';
import 'package:wish_list/ui/widgets/general_button.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../../utils/i_wish_icons.dart';
import '../../../../utils/validators.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../components/funding_successful_dialog.dart';

class EnterTransactionPinScreen extends StatefulWidget {
  const EnterTransactionPinScreen({Key? key}) : super(key: key);

  @override
  State<EnterTransactionPinScreen> createState() =>
      _EnterTransactionPinScreen();
}

class _EnterTransactionPinScreen extends State<EnterTransactionPinScreen> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWithBackButton(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: widthSizer(24, context)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: heightSizer(10, context)),
          Text(
            'Transaction pin',
            style: AppTextStyles.heading2(context)
                .copyWith(fontSize: widthSizer(24, context)),
          ),
          SizedBox(height: heightSizer(12, context)),
          Text(
            'Enter your transaction PIN to proceed with your payment',
            style: AppTextStyles.mediumBodyText(context)
                .copyWith(color: AppColors.textBlack),
          ),
          SizedBox(height: heightSizer(40, context)),
          CustomTextFieldWithLabel(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
            label: 'Enter PIN',
            keyboardType: TextInputType.visiblePassword,
            validator: Validators.isNotEmpty,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  obscurePassword = !obscurePassword;
                });
              },
              child: const Icon(IWishIcons.fluent_eye_24_regular,
                  color: AppColors.textBlack),
            ),
          ),
          SizedBox(height: heightSizer(48, context)),
          GeneralButton(
            buttonText: 'Fund Wallet',
            onPressed: () {
              Navigator.pop(context);
              FundingSuccessfulDialog.show(context);
            },
            textFontWeight: FontWeight.w400,
            textFontSize: widthSizer(16, context),
          )
        ]),
      ),
    );
  }
}
