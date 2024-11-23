import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';
import '../../utils/i_wish_icons.dart';
import '../../utils/widget_size_utils.dart';

class InfoCard extends StatelessWidget {
  const InfoCard(
      {Key? key,
        required this.title,
        required this.details,
        required this.onTap})
      : super(key: key);

  final String title;
  final String details;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: heightSizer(17, context),
            horizontal: widthSizer(10, context)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: const Color(0xFFAEAEAE).withOpacity(.15),
                blurRadius: 20,
                offset: const Offset(0, 8))
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: widthSizer(270, context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.heading4(context)),
                  SizedBox(height: heightSizer(6, context)),
                  Text(details,
                      style: AppTextStyles.mediumBodyText(context)
                          .copyWith(color: AppColors.textBlack))
                ],
              ),
            ),
            const Icon(
              IWishIcons.fluent_chevron_circle_right_24_regular,
              color: AppColors.lightPurple,
            )
          ],
        ),
      ),
    );
  }
}
