import 'package:flutter/material.dart';

import '../../../../utils/app_text_styles.dart';
import '../../../../utils/router/route_names.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/general_button.dart';

/// Displayed when user has no wishlist
class NoWishListYetView extends StatelessWidget {
  const NoWishListYetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
            width: widthSizer(200, context),
            height: heightSizer(150, context),
            child:
                Image.asset('assets/images/no_wishlist_yet_screen_image.png')),
        SizedBox(height: heightSizer(24, context)),
        Text('No wishlist yet',
            textAlign: TextAlign.center,
            style: AppTextStyles.heading2(context)),
        SizedBox(height: heightSizer(12, context)),
        Text('How about we start by creating a few?',
            textAlign: TextAlign.start, style: AppTextStyles.bodyText(context)),
        SizedBox(height: heightSizer(24, context)),
        GeneralButton(
          buttonText: 'Create a Wishlist',
          height: 58,
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.createWishListScreen);
          },
        )
      ]),
    );
  }
}
