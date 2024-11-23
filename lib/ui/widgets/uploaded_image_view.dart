import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';
import '../../utils/i_wish_icons.dart';
import '../../utils/widget_size_utils.dart';
import 'icon_container.dart';

/// Displays just the logo, name and obscured card number
class UploadedImageView extends StatelessWidget {
  final String imageName;

  const UploadedImageView(
      {Key? key,
        this.imageName = 'shopping_cart_with_star_with_background.png'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 9),
        height: heightSizer(58, context),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: AppColors.bgColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Image.asset('assets/images/$imageName'),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: widthSizer(212, context),
              child: Text(
                imageName,
                style: AppTextStyles.bodyText(context),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
            const IconContainer(
                width: 40,
                child: Icon(
                  IWishIcons.carbon_close,
                  color: Colors.white,
                ))
          ],
        ));
  }
}
