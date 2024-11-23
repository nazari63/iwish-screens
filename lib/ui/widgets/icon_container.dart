import 'package:flutter/material.dart';
import 'package:wish_list/utils/app_colors.dart';

import '../../utils/widget_size_utils.dart';

class IconContainer extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final Color borderColor;
  final double width;
  final bool bordered;
  final EdgeInsets margin;

  /// defaults to the [width]
  final double? height;
  final double borderWidth;

  const IconContainer(
      {Key? key,
      required this.child,
      this.backgroundColor = AppColors.primaryColor,
      required this.width,
      this.height,
      this.bordered = false,
      this.borderColor = AppColors.primaryColor,
      this.margin = EdgeInsets.zero,
      this.borderWidth = 2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // alignment: Alignment.center,
        width: width,
        height: height ?? width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widthSizer(8, context)),
          border: bordered
              ? Border.all(color: borderColor, width: borderWidth)
              : const Border(),
          color: backgroundColor,
        ),
        child: Center(child: child));
  }
}
