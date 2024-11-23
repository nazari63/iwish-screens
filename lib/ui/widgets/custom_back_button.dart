import 'package:flutter/material.dart';

import '../../utils/i_wish_icons.dart';
import '../../utils/widget_size_utils.dart';

/// To use this back button in an [AppBar], set 'leadingWidth: 120,'
///  that is the 'leadingWidth' of the [AppBar] must be set to at least 100
class CustomBackButton extends StatelessWidget {
  const CustomBackButton(
      {Key? key,
      this.label = 'Back',
      this.padding = const EdgeInsets.symmetric(horizontal: 24),
      this.backRoute})
      : super(key: key);

  final String label;
  final EdgeInsets padding;

  /// The route to navigate when button is pressed.
  /// if null defaults to Navigator.pop();
  final String? backRoute;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (backRoute != null) {
          Navigator.popUntil(context, ModalRoute.withName(backRoute!));
        } else {
          Navigator.pop(context);
        }
      },
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              IWishIcons.fluent_ios_arrow_rtl_24_regular,
              color: Color(0xFF4F4F4F),
              size: 16,
            ),
            SizedBox(width: widthSizer(10, context)),
            Text(label, style: const TextStyle(color: Color(0xFF4F4F4F)))
          ],
        ),
      ),
    );
  }
}
