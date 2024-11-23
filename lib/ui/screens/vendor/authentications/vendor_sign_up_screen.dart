import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/router/route_names.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/reusable_screens/sign_up_form.dart';

class VendorSignUpScreen extends StatelessWidget {
  const VendorSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWithSkipButton(onSkipPressed: () {}),
      body: SignUpForm(
        title: 'Vendor Account',
        subtitle: 'Create an account to become a vendor on \ni-wish store',
        eyeColor: AppColors.textBlack,
        infoColor: const Color(0xFFA5A5A5),
        onFormSubmitted: (
            {required String name,
            required String email,
            required String userName,
            required String mobileNumber,
            required String password}) {
          Navigator.pushNamed(context, RouteNames.vendorOverviewScreen);
        },
      ),
    );
  }
}
