import 'package:flutter/material.dart';
import 'package:wish_list/utils/app_text_styles.dart';

import '../../../utils/app_colors.dart';
import '../../widgets/reusable_screens/verify_otp_form.dart';
import 'two_factor_auth_successful_dialog.dart';

class VerifyTwoFaOtpScreen extends StatelessWidget {
  const VerifyTwoFaOtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VerifyOtpForm(
      centerTextWidget: Text(
        'Please, enter the 5 digit code sent to your mobile number for verification.',
        style: AppTextStyles.bodyText(context)
            .copyWith(color: AppColors.textBlack),
      ),
      onVerifyCode: () {
        TwoFactorAuthSuccessfulDialog.show(context);
      },
    );
  }
}
