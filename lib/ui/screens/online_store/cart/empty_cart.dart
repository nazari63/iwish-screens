import 'package:flutter/material.dart';
import 'package:wish_list/utils/app_colors.dart';

import '../../../../utils/app_text_styles.dart';
import '../../../../utils/router/route_names.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/custom_back_button.dart';
import '../../../widgets/general_button.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(children: [
        const Align(
            alignment: Alignment.centerLeft,
            child: CustomBackButton(padding: EdgeInsets.zero)),
        SizedBox(height: heightSizer(70, context)),
        SizedBox.square(
            dimension: widthSizer(200, context),
            child: Image.asset(
              'assets/images/empty_cart_image.png',
              fit: BoxFit.scaleDown,
            )),
        SizedBox(height: heightSizer(24, context)),
        Text('Your Cart is empty',
            textAlign: TextAlign.center,
            style: AppTextStyles.heading3(context)),
        SizedBox(height: heightSizer(12, context)),
        Text(
            'Browse our categories and discover \nawesome products just for you',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.textBlack,
                fontWeight: FontWeight.w400,
                fontSize: widthSizer(16, context))),
        SizedBox(height: heightSizer(48, context)),
        GeneralButton(
          textFontSize: widthSizer(16, context),
          textFontWeight: FontWeight.w400,
          buttonText: 'Start Shopping',
          height: 58,
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.onlineWishlistStore);
          },
        )
      ]),
    );
  }
}
