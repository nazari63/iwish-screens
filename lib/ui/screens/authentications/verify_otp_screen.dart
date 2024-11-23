import 'package:flutter/material.dart';

import '../../../utils/router/route_names.dart';
import '../../../utils/widget_size_utils.dart';
import '../../widgets/reusable_screens/verify_otp_form.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VerifyOtpForm(
      centerTextWidget: RichText(
          text: TextSpan(
              style: TextStyle(
                  fontSize: widthSizer(16, context),
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF333333),
                  height: 1.2),
              children: const [
            TextSpan(
                text:
                    'Please, enter the 5 digit code sent to your email for verification. '),
            TextSpan(
                text: 'Open Email App',
                style: TextStyle(decoration: TextDecoration.underline))
          ])),
      onVerifyCode: () {
        Navigator.pushNamed(context, RouteNames.homeScreen);
      },
    );
  }
}
