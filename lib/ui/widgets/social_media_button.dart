import 'package:flutter/material.dart';
import 'package:wish_list/utils/app_colors.dart';
import 'package:wish_list/utils/i_wish_icons.dart';

import '../../utils/widget_size_utils.dart';

class FacebookLoginButton extends StatelessWidget {
  const FacebookLoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SocialMediaButton(
      icon: Icon(
        IWishIcons.bi_facebook,
        color: const Color(0xFF4267B2),
        size: widthSizer(16, context),
      ),
      label: 'Facebook',
      onPressed: () {},
    );
  }
}

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SocialMediaButton(
      icon: SizedBox.square(
        dimension: widthSizer(16, context),
        child: Image.asset(
          'assets/images/google-logo.png',
          fit: BoxFit.scaleDown,
        ),
      ),
      label: 'Google',
      onPressed: () {},
    );
  }
}

class SocialMediaButton extends StatelessWidget {
  final String label;

  final Widget icon;
  final double height;
  final double childrenSpacing;
  final FontWeight fontWeight;
  final double borderWidth;
  final Color borderColor;
  final Color textColor;
  final VoidCallback onPressed;

  const SocialMediaButton(
      {Key? key,
      required this.icon,
      required this.label,
      this.fontWeight = FontWeight.normal,
      this.height = 48,
      this.textColor = Colors.black,
      this.borderColor = AppColors.textBlack,
      this.childrenSpacing = 13.5,
      this.borderWidth = 1,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: widthSizer(15, context)),
        height: heightSizer(height, context),
        width: widthSizer(140, context),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: borderWidth, color: borderColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(width: widthSizer(childrenSpacing, context)),
            Text(
              label,
              style: TextStyle(
                  fontSize: widthSizer(16, context),
                  color: textColor,
                  fontWeight: fontWeight),
            ),
          ],
        ),
      ),
    );
  }
}
