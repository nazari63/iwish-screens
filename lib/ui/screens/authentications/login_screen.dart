import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wish_list/ui/widgets/custom_app_bar.dart';
import 'package:wish_list/utils/app_colors.dart';
import 'package:wish_list/utils/i_wish_icons.dart';
import 'package:wish_list/utils/validators.dart';

import '../../../utils/router/route_names.dart';
import '../../../utils/widget_size_utils.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/divider_with_or.dart';
import '../../widgets/general_button.dart';
import '../../widgets/social_media_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWithBackButton(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: widthSizer(24, context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: heightSizer(24, context)),
            Text('Sign In',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: widthSizer(24, context))),
            SizedBox(height: heightSizer(12, context)),
            Text('Login to continue enjoying the seamless \nexploration',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColors.textBlack,
                    fontSize: widthSizer(16, context))),
            SizedBox(height: heightSizer(36, context)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [GoogleLoginButton(), FacebookLoginButton()],
            ),
            SizedBox(height: heightSizer(24, context)),
            const DividerWithOr(),
            SizedBox(height: heightSizer(24, context)),
            const CustomTextFieldWithLabel(
              label: 'Email',
              keyboardType: TextInputType.emailAddress,
              validator: Validators.isEmail,
            ),
            SizedBox(height: heightSizer(24, context)),
            CustomTextFieldWithLabel(
              label: 'Password',
              keyboardType: TextInputType.visiblePassword,
              validator: Validators.isNotEmpty,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
                child: const Icon(
                  IWishIcons.fluent_eye_24_regular,
                  color: Color(0xFF9747FF),
                  size: 16,
                ),
              ),
            ),
            SizedBox(height: heightSizer(12, context)),
            Text(
              'Forgot Password?',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                  color: AppColors.textBlack,
                  fontSize: widthSizer(16, context)),
            ),
            SizedBox(height: heightSizer(36, context)),
            GeneralButton(
                buttonText: 'Sign In',
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.homeScreen);
                }),
            SizedBox(height: heightSizer(60, context)),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.signUpScreen);
                },
                child: RichText(
                    text: TextSpan(
                        style: GoogleFonts.nunitoSans(
                          fontSize: widthSizer(16.0, context),
                          fontWeight: FontWeight.w400,
                          color: AppColors.textBlack,
                        ),
                        children: const [
                      TextSpan(text: 'Don’t have an account? '),
                      TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline))
                    ])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
