import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../../../utils/router/route_names.dart';
import '../../../utils/validators.dart';
import '../../../utils/widget_size_utils.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/general_button.dart';

class SmsVerificationScreen extends StatelessWidget {
  const SmsVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWithBackButton(
        leadingWidth: 150,
        backButtonText: 'Profile',
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              horizontal: widthSizer(24, context),
              vertical: heightSizer(20, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('SMS verification',
                  style: TextStyle(
                    fontSize: widthSizer(24, context),
                    fontWeight: FontWeight.w700,
                  )),
              SizedBox(height: heightSizer(12, context)),
              Text(
                  'Enter a mobile number you want the login OTP sent to. Please, you must still have access to this mobile number.',
                  style: AppTextStyles.mediumBodyText(context)
                      .copyWith(color: AppColors.textBlack)),
              SizedBox(height: heightSizer(24, context)),
              CustomTextFieldWithLabel(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                label: 'Mobile Number',
                validator: (value) => Validators.isValidNumberAndLength(value),
              ),
              SizedBox(height: heightSizer(48, context)),
              GeneralButton(
                buttonText: 'Verify Number',
                onPressed: () {
                  Navigator.pushNamed(
                      context, RouteNames.verifyTwoFaSmsOtpScreen);
                },
                textFontWeight: FontWeight.w400,
                textFontSize: widthSizer(16, context),
              ),
            ],
          )),
    );
  }
}
