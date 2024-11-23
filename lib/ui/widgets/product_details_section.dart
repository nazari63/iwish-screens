import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';
import '../../utils/widget_size_utils.dart';

class ProductDetailsSection extends StatelessWidget {
  const ProductDetailsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Product Details', style: AppTextStyles.heading3(context)),
        SizedBox(height: heightSizer(12, context)),
        Padding(
          padding: EdgeInsets.only(left: widthSizer(8.5, context)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sub total',
                    style: TextStyle(
                        fontSize: widthSizer(16, context),
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '#100,000',
                    style: AppTextStyles.mediumBodyText(context)
                        .copyWith(color: AppColors.textBlack),
                  ),
                ],
              ),
              SizedBox(height: heightSizer(12, context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Discount',
                    style: TextStyle(
                        fontSize: widthSizer(16, context),
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '0%',
                    style: AppTextStyles.mediumBodyText(context)
                        .copyWith(color: AppColors.textBlack),
                  ),
                ],
              ),
              SizedBox(height: heightSizer(12, context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Shipping',
                    style: TextStyle(
                        fontSize: widthSizer(16, context),
                        fontWeight: FontWeight.w700),
                  ),
                  Text('#5,000',
                      style: AppTextStyles.mediumBodyText(context)
                          .copyWith(color: AppColors.textBlack)),
                ],
              ),
              SizedBox(height: heightSizer(12, context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Order',
                    style: TextStyle(
                        fontSize: widthSizer(16, context),
                        fontWeight: FontWeight.w700),
                  ),
                  Text('#105,000',
                      style: AppTextStyles.mediumBodyText(context)
                          .copyWith(color: AppColors.textBlack)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
