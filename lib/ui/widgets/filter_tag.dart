import 'package:flutter/material.dart';
import 'package:wish_list/utils/app_text_styles.dart';

import '../../utils/app_colors.dart';
import '../../utils/widget_size_utils.dart';

class FilterTag extends StatelessWidget {
  final String tagName;
  final bool isActive;

  const FilterTag({Key? key, required this.tagName, this.isActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: heightSizer(29, context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: isActive ? const Color(0xFF080016) : AppColors.bgColor),
      child: Center(
          child: Text(
        tagName,
        style: AppTextStyles.smallBodyText(context)
            .copyWith(color: isActive ? Colors.white : AppColors.textBlack),
      )),
    );
  }
}
