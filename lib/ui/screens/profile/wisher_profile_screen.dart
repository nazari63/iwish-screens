import 'package:flutter/material.dart';
import 'package:wish_list/ui/widgets/custom_back_button.dart';

import '../../../models/user.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/widget_size_utils.dart';
import '../../widgets/bottom_nav.dart';
import '../../widgets/general_button.dart';
import '../../widgets/profile_screen_security_section.dart';

class WisherProfileScreen extends StatelessWidget {
  const WisherProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WisherBottomNav(
      currentNavParent: BottomNavParent.profile,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leadingWidth: 150,
            leading: const CustomBackButton(label: "Home"),
          ),
          body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: widthSizer(24, context),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: heightSizer(12, context)),
                  ProfileScreenHeading(user: Wisher.demoWisher1),
                  SizedBox(height: heightSizer(24, context)),
                  ProfileScreenNameAndImage(name: Wisher.demoWisher1.name),
                  SizedBox(height: heightSizer(48, context)),
                  Text(
                    'Account Details',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: widthSizer(24, context)),
                  ),
                  SizedBox(height: heightSizer(12, context)),
                  ProfileScreenFieldAndValue(
                    field: 'Email',
                    value: Wisher.demoWisher1.email,
                  ),
                  SizedBox(height: heightSizer(24, context)),
                  ProfileScreenFieldAndValue(
                      field: 'Mobile Number',
                      value: Wisher.demoWisher1.mobileNumber),
                  SizedBox(height: heightSizer(24, context)),
                  ProfileScreenFieldAndValue(
                      field: 'Billing Address',
                      value: Wisher.demoWisher1.billingAddress),
                  SizedBox(height: heightSizer(12, context)),
                  GeneralButton(
                    buttonText: 'Edit Address',
                    onPressed: () {},
                    width: widthSizer(140, context),
                    height: heightSizer(48, context),
                    buttonColor: Colors.white,
                    borderColor: AppColors.primaryColor,
                    textFontWeight: FontWeight.w700,
                    textFontSize: widthSizer(16, context),
                    textColor: AppColors.primaryColor,
                  ),
                  SizedBox(height: heightSizer(48, context)),
                  const ProfileScreenSecuritySection(),
                ],
              ))),
    );
  }
}
