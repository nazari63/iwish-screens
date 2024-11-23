import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';
import '../../utils/i_wish_icons.dart';
import '../../utils/widget_size_utils.dart';

class CustomDropDownButton<T> extends StatelessWidget {
  const CustomDropDownButton(
      {Key? key,
      this.value,
      this.hintText = "Select a value",
      this.onChanged,
      this.label,
      this.items})
      : super(key: key);

  final String? label;
  final T? value;
  final String hintText;
  final void Function(T?)? onChanged;
  final List<DropdownMenuItem<T>>? items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: EdgeInsets.only(bottom: heightSizer(12, context)),
            child: Text(
              label!,
              style: AppTextStyles.bodyText(context)
                  .copyWith(color: AppColors.textBlack),
            ),
          ),
        Container(
          height: heightSizer(58, context),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(8)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              icon: const Icon(IWishIcons.fluent_ios_arrow_down_24_regular),
              dropdownColor: const Color(0xFFF5F5F5),
              isExpanded: true,
              focusColor: const Color(0xFFF5F5F5),
              value: value,
              hint: Text(
                hintText,
                style: AppTextStyles.bodyText(context)
                    .copyWith(color: AppColors.textBlack),
              ),
              style: AppTextStyles.bodyText(context)
                  .copyWith(color: AppColors.textBlack),
              iconEnabledColor: Colors.grey,
              items: items,
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
