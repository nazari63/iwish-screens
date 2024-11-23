import 'package:flutter/material.dart';

import '../../models/user.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';
import '../../utils/router/route_names.dart';
import '../../utils/widget_size_utils.dart';
import 'general_button.dart';

class ProfileScreenSecuritySection extends StatelessWidget {
  const ProfileScreenSecuritySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Security',
          style: AppTextStyles.heading3(context),
        ),
        SizedBox(height: heightSizer(12, context)),
        ProfileScreenFieldAndValue(
            field: 'Password',
            value: 'Change Password',
            valueTextColor: AppColors.primaryColor,
            valueFontWeight: FontWeight.w700,
            onValueTap: () {
              Navigator.pushNamed(context, RouteNames.changePassword);
            }),
        SizedBox(height: heightSizer(24, context)),
        ProfileScreenFieldAndValue(
            field: 'Two-Factor Authentication',
            value: 'Enable two-factor Authentication',
            valueTextColor: AppColors.primaryColor,
            valueFontWeight: FontWeight.w700,
            onValueTap: () {
              Navigator.pushNamed(context, RouteNames.twoFactorAuthScreen);
            }),
        SizedBox(height: heightSizer(40, context)),
      ],
    );
  }
}

class ProfileScreenNameAndImage extends StatelessWidget {
  const ProfileScreenNameAndImage({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: widthSizer(140, context),
          height: heightSizer(110, context),
          decoration: BoxDecoration(
              image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage('https://i.pravatar.cc/200')),
              borderRadius: BorderRadius.circular(8)),
        ),
        SizedBox(width: widthSizer(12, context)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: widthSizer(24, context)),
            ),
            SizedBox(height: heightSizer(12, context)),
            GeneralButton(
              buttonText: 'New Upload',
              onPressed: () {},
              width: widthSizer(140, context),
              height: heightSizer(48, context),
              textFontWeight: FontWeight.w700,
              textFontSize: widthSizer(16, context),
              buttonColor: Colors.white,
              borderColor: AppColors.primaryColor,
              textColor: AppColors.primaryColor,
            )
          ],
        )
      ],
    );
  }
}

class ProfileScreenHeading extends StatelessWidget {
  const ProfileScreenHeading({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('User Profile',
            style: TextStyle(
              fontSize: widthSizer(24, context),
              fontWeight: FontWeight.w700,
            )),
        GeneralButton(
          height: heightSizer(48, context),
          buttonText: 'Edit Profile',
          textFontWeight: FontWeight.w400,
          textFontSize: widthSizer(16, context),
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.editProfileScreen,
                arguments: user);
          },
          width: widthSizer(140, context),
        )
      ],
    );
  }
}

class ProfileScreenFieldAndValue extends StatelessWidget {
  const ProfileScreenFieldAndValue(
      {Key? key,
      required this.field,
      required this.value,
      this.valueTextColor = AppColors.textBlack,
      this.valueFontWeight = FontWeight.w400,
      this.onValueTap})
      : super(key: key);

  final String field;
  final String value;
  final Color valueTextColor;
  final FontWeight valueFontWeight;
  final VoidCallback? onValueTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          field,
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: widthSizer(18, context)),
        ),
        SizedBox(height: heightSizer(6, context)),
        GestureDetector(
          onTap: onValueTap,
          child: Text(
            value,
            style: TextStyle(
                fontWeight: valueFontWeight,
                fontSize: widthSizer(16, context),
                color: valueTextColor),
          ),
        ),
      ],
    );
  }
}
