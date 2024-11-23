import 'package:flutter/material.dart';
import 'package:wish_list/ui/screens/wallet_screens/wallet_view_model.dart';
import 'package:wish_list/ui/widgets/general_button.dart';
import 'package:wish_list/utils/validators.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../../../utils/i_wish_icons.dart';
import '../../../utils/service_locator.dart';
import '../../../utils/widget_size_utils.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_text_form_field.dart';

class BVNVerificationScreen extends StatelessWidget {
  const BVNVerificationScreen({Key? key}) : super(key: key);

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
            Text(
              'BVN Verification',
              style: AppTextStyles.heading2(context),
            ),
            SizedBox(height: heightSizer(24, context)),
            CustomTextFieldWithLabel(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
              label: 'Bank Verification Number',
              keyboardType: TextInputType.number,
              hintText: 'Your Bank Verification Number',
              validator: (value) =>
                  Validators.isValidNumberAndLength(value, length: 10),
            ),
            SizedBox(height: heightSizer(12, context)),
            Row(
              children: [
                const Icon(
                  IWishIcons.fluent_info_20_regular,
                  color: Color(0xFF2F80ED),
                  size: 18,
                ),
                SizedBox(width: widthSizer(8, context)),
                Text(
                  'Your BVN won’t be shared with any third party.',
                  style: AppTextStyles.smallBodyText(context)
                      .copyWith(color: AppColors.textBlack),
                ),
              ],
            ),
            SizedBox(height: heightSizer(240, context)),
            GeneralButton(
              buttonText: 'Proceed',
              onPressed: () {
                Navigator.pop(context);
                serviceLocator<WalletViewModel>().registerBVN();
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
