import 'package:flutter/material.dart';
import 'package:wish_list/ui/widgets/general_button.dart';
import 'package:wish_list/utils/app_colors.dart';

import '../../../utils/app_text_styles.dart';
import '../../../utils/i_wish_icons.dart';
import '../../../utils/router/route_names.dart';
import '../../../utils/widget_size_utils.dart';

class TwoFactorAuthSuccessfulDialog extends StatelessWidget {
  static show(BuildContext context) {
    showDialog(
        context: context,
        barrierColor: Colors.white70,
        barrierDismissible: false,
        builder: (context) {
          return const TwoFactorAuthSuccessfulDialog._();
        });
  }

  const TwoFactorAuthSuccessfulDialog._({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.white70,
      insetPadding: EdgeInsets.all(widthSizer(24, context)),
      child: Container(
        width: widthSizer(327, context),
        height: heightSizer(340, context),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Color(0x26AEAEAE),
                  blurRadius: 20,
                  offset: Offset(0, -8)),
              BoxShadow(
                  color: Color(0x26AEAEAE),
                  blurRadius: 20,
                  offset: Offset(0, 8))
            ]),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                IWishIcons.fluent_arrow_sync_checkmark_20_filled,
                color: AppColors.green,
                size: 60,
              ),
              SizedBox(height: heightSizer(12, context)),
              Text(
                '2FA Successful',
                style: AppTextStyles.heading3(context),
              ),
              SizedBox(height: heightSizer(12, context)),
              Text(
                'Two-factor authentication has been\n successfully added to your account.',
                textAlign: TextAlign.center,
                style: AppTextStyles.mediumBodyText(context)
                    .copyWith(height: 1.2, color: AppColors.textBlack),
              ),
              SizedBox(height: heightSizer(24, context)),
              GeneralButton(
                buttonText: 'Done',
                onPressed: () {
                  /// Go back to the appropriate profile screen
                  Navigator.popUntil(context, (route) {
                    final currentRouteName = route.settings.name;
                    return currentRouteName == RouteNames.wisherProfileScreen ||
                        currentRouteName == RouteNames.vendorProfileScreen;
                  });
                },
                width: widthSizer(140, context),
                height: heightSizer(48, context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
