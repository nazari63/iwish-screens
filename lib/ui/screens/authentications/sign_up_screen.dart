import 'package:flutter/material.dart';

import '../../../utils/router/route_names.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/reusable_screens/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWithSkipButton(onSkipPressed: () {}),
      body: SignUpForm(
        title: 'Create Account',
        subtitle: 'Create an account to enjoy seamless \nexploration.',
        onFormSubmitted: (
            {required String name,
            required String email,
            required String userName,
            required String mobileNumber,
            required String password}) {
          Navigator.pushNamed(context, RouteNames.verifyOtpScreen);
        },
      ),
    );
  }
}
