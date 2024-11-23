import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';
import '../../utils/i_wish_icons.dart';
import '../../utils/widget_size_utils.dart';

class UploadImageContainer extends StatelessWidget {
  const UploadImageContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: widthSizer(24, context)),
      height: heightSizer(198, context),
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.bgColor, borderRadius: BorderRadius.circular(8)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Upload your image', style: AppTextStyles.heading4(context)),
        Padding(
          padding: EdgeInsets.only(
              top: heightSizer(6, context), bottom: heightSizer(3, context)),
          child: Text('Upload the picture of the product category.',
              style: AppTextStyles.smallBodyText(context)),
        ),
        Text('Accepted format : .jpg, .png, .jpeg',
            style: AppTextStyles.smallBodyText(context)),
        SizedBox(height: heightSizer(12, context)),
        DottedBorder(
          padding: const EdgeInsets.all(0),
          radius: const Radius.circular(8),
          borderType: BorderType.RRect,
          strokeWidth: .5,
          child: Container(
            height: heightSizer(89, context),
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFE1CBFF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(IWishIcons.fluent_cloud_arrow_up_32_regular,
                    color: Color(0xFF4F4F4F)),
                Text('Browse to upload your file',
                    style: AppTextStyles.smallBodyText(context)
                        .copyWith(color: AppColors.textBlack)),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
