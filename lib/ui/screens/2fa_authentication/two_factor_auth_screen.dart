import 'package:flutter/material.dart';
import 'package:wish_list/ui/widgets/custom_app_bar.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../../../utils/router/route_names.dart';
import '../../../utils/widget_size_utils.dart';
import '../../widgets/info_card.dart';

class TwoFactorAuthScreen extends StatelessWidget {
  const TwoFactorAuthScreen({Key? key}) : super(key: key);

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
              Text('Two-Factor Authentication',
                  style: TextStyle(
                    fontSize: widthSizer(24, context),
                    fontWeight: FontWeight.w700,
                  )),
              SizedBox(height: heightSizer(12, context)),
              Text(
                  'Use additional login option to prevent unauthorized access to your iWish account ',
                  style: AppTextStyles.mediumBodyText(context)
                      .copyWith(color: AppColors.textBlack)),
              SizedBox(height: heightSizer(12, context)),
              InfoCard(
                title: 'SMS Verification',
                details: 'Receive login OTP through SMS',
                onTap: () {
                  Navigator.pushNamed(
                      context, RouteNames.smsVerificationScreen);
                },
              ),
              SizedBox(height: heightSizer(24, context)),
              InfoCard(
                title: 'Email notification',
                details:
                    'Grant access through verification link that will be sent to your verified email',
                onTap: () {},
              ),
            ],
          )),
    );
  }
}
