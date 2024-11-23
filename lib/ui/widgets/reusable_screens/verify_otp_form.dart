import 'package:flutter/material.dart';
import 'package:wish_list/utils/app_text_styles.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/widget_size_utils.dart';
import '../custom_app_bar.dart';
import '../general_button.dart';
import '../pin_text_input.dart';

class VerifyOtpForm extends StatelessWidget {
  VerifyOtpForm(
      {Key? key,
      this.headingTextColor = AppColors.textBlack,
      required this.centerTextWidget,
      required this.onVerifyCode})
      : super(key: key);

  final Color headingTextColor;
  final Widget centerTextWidget;
  final VoidCallback onVerifyCode;

  final TextEditingController _otpTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWithBackButton(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: widthSizer(24, context)),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: heightSizer(20, context)),
              Text('Verification Code',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: headingTextColor,
                      fontSize: widthSizer(24, context))),
              SizedBox(height: heightSizer(12, context)),
              Center(
                child: SizedBox.square(
                    dimension: widthSizer(250, context),
                    child: Image.asset(
                        'assets/images/verification_screen_image.png',
                        fit: BoxFit.scaleDown)),
              ),
              SizedBox(height: heightSizer(14, context)),
              centerTextWidget,
              SizedBox(height: heightSizer(24, context)),
              PinTextInput(pinTextController: _otpTextController),
              SizedBox(height: heightSizer(48, context)),
              GeneralButton(
                  buttonText: 'Verify Code',
                  onPressed: () {
                    onVerifyCode();
                  }),
              SizedBox(height: heightSizer(24, context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      text: TextSpan(
                          style: TextStyle(
                            fontSize: widthSizer(16.0, context),
                            fontWeight: FontWeight.w400,
                            color: AppColors.textBlack,
                          ),
                          children: [
                        const TextSpan(text: "Didn’t receive any code? "),
                        TextSpan(
                            text: 'Resend code',
                            style: AppTextStyles.bodyText(context).copyWith(
                                color: AppColors.primaryColor,
                                decoration: TextDecoration.underline))
                      ])),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
