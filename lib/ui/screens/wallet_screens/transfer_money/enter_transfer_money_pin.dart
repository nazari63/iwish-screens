import 'package:flutter/material.dart';
import 'package:wish_list/ui/widgets/general_button.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../../utils/i_wish_icons.dart';
import '../../../../utils/validators.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_text_form_field.dart';
import 'transfer _money_successful_dialog.dart';

class EnterTransferMoneyPinScreen extends StatefulWidget {
  const EnterTransferMoneyPinScreen({Key? key}) : super(key: key);

  @override
  State<EnterTransferMoneyPinScreen> createState() =>
      _EnterTransferMoneyPinScreen();
}

class _EnterTransferMoneyPinScreen extends State<EnterTransferMoneyPinScreen> {
  bool obscurePassword = true;

  final _pinTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWithBackButton(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            vertical: heightSizer(16, context),
            horizontal: widthSizer(24, context)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            obscureText: obscurePassword,
            controller: _pinTextController,
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
            buttonText: 'Make Transfer',
            onPressed: () {
              TransferMoneySuccessfulDialog.show(context);
            },
            textFontWeight: FontWeight.w400,
            textFontSize: widthSizer(16, context),
          )
        ]),
      ),
    );
  }
}
