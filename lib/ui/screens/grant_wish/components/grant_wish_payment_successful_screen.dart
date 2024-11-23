import 'package:flutter/material.dart';
import 'package:wish_list/utils/router/route_names.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/general_button.dart';

class GrantWishPaymentSuccessfulScreen extends StatelessWidget {
  const GrantWishPaymentSuccessfulScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWithBackButton(
        title: Text(
          'Grant Wish',
          style: AppTextStyles.heading4(context),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: widthSizer(24, context)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox.square(
                dimension: widthSizer(200, context),
                child: Image.asset(
                  'assets/images/black_and_purple_magic_wand_with_background.png',
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(height: heightSizer(24, context)),
              Text(
                'Transaction successful',
                style: AppTextStyles.heading3(context),
              ),
              SizedBox(height: heightSizer(12, context)),
              Text(
                'Wishlist item has been successfully granted',
                style: AppTextStyles.bodyText(context)
                    .copyWith(color: AppColors.textBlack),
              ),
              SizedBox(height: heightSizer(48, context)),
              GeneralButton(
                buttonText: 'Go back to Wishlist',
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.grantWishScreen);
                },
                height: heightSizer(58, context),
              ),
              SizedBox(height: heightSizer(32, context)),
              GeneralButton(
                buttonText: 'Create your Wishlist',
                buttonColor: Colors.transparent,
                textColor: AppColors.primaryColor,
                textFontWeight: FontWeight.w700,
                textFontSize: widthSizer(16, context),
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, RouteNames.wishListScreen);
                },
                height: heightSizer(58, context),
              ),
            ],
          )),
    );
  }
}
