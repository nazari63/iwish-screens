import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../../../utils/router/route_names.dart';
import '../../../utils/widget_size_utils.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/general_button.dart';

class CreateAccountOption extends StatelessWidget {
  const CreateAccountOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithSkipButton(
        title: Text(
          'Create Account',
          style: AppTextStyles.heading2(context).copyWith(fontSize: 24),
        ),
        onSkipPressed: () {},
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: widthSizer(24, context)),
        child: Column(
          children: [
            SizedBox(height: heightSizer(32, context)),
            _OptionDetailsWidget(
              title: 'Sign-up as a Wisher',
              subtitle:
                  'When you signup as a wisher, you get \nto select and create unlimited wishlist \nor select from our online store',
              buttonText: 'Continue as a wisher',
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.signUpScreen);
              },
              imagePath:
                  'assets/images/black_and_purple_magic_wand_with_background.png',
            ),
            SizedBox(height: heightSizer(48, context)),
            _OptionDetailsWidget(
              title: 'Sign-up as a Vendor',
              subtitle:
                  'Become a vendor on iwish online store \nand get to showcase your items with \nease',
              buttonText: 'Continue as a vendor',
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.vendorSignUpScreen);
              },
              imagePath:
                  'assets/images/shopping_cart_with_star_with_background.png',
            ),
          ],
        ),
      ),
    );
  }
}

class _OptionDetailsWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;

  final String buttonText;
  final void Function() onPressed;

  const _OptionDetailsWidget(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.buttonText,
      required this.onPressed,
      required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox.square(
          dimension: widthSizer(100, context),
          child: Image.asset(imagePath),
        ),
        SizedBox(height: heightSizer(24, context)),
        Text(title, style: AppTextStyles.heading4(context)),
        SizedBox(height: heightSizer(12, context)),
        Text(subtitle,
            style: AppTextStyles.bodyText(context)
                .copyWith(color: AppColors.textBlack)),
        SizedBox(height: heightSizer(24, context)),
        GeneralButton(
          buttonText: buttonText,
          onPressed: onPressed,
          textFontWeight: FontWeight.w400,
          textFontSize: 16,
          height: heightSizer(58, context),
        )
      ],
    );
  }
}
