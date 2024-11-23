import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';
import '../../utils/widget_size_utils.dart';

class DetailsItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final double marginBottom;
  final double horizontalPadding;
  final double endIndent;

  const DetailsItem(
      {Key? key,
      required this.title,
      required this.subTitle,
      this.marginBottom = 24,
      this.horizontalPadding = 21,
        this.endIndent = 9})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: widthSizer(horizontalPadding, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.mediumBodyText(context)
                    .copyWith(color: AppColors.textGrey),
              ),
              SizedBox(height: heightSizer(6, context)),
              Text(
                subTitle,
                style: AppTextStyles.bodyText(context)
                    .copyWith(color: AppColors.textBlack),
              ),
            ],
          ),
        ),
        SizedBox(height: heightSizer(marginBottom, context)),
        Divider(
          color: AppColors.bgColor,
          endIndent: widthSizer(endIndent, context),
          height: 2,
        ),
      ],
    );
  }
}
