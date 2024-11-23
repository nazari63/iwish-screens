import 'package:flutter/material.dart';
import 'package:wish_list/ui/widgets/general_button.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../../utils/router/route_names.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../utils/i_wish_icons.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_back_button.dart';
import '../../widgets/drawer_menu.dart';
import '../../widgets/iWish_voucher_widget.dart';
import '../../widgets/product_details_section.dart';
import '../online_store/components/cart_items_list.dart';

class BoxItemScreen extends StatelessWidget {
  const BoxItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      backgroundColor: Colors.white,
      appBar: const AppBarWithActions(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(widthSizer(24, context)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CustomBackButton(padding: EdgeInsets.zero),
          SizedBox(height: heightSizer(24, context)),
          Text('View Box Items', style: AppTextStyles.heading2(context)),
          SizedBox(height: heightSizer(24, context)),
          const CartItemsList(),
          SizedBox(height: heightSizer(24, context)),
          GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'See all Items',
                  style: AppTextStyles.mediumBodyText(context)
                      .copyWith(color: AppColors.lightPurple),
                ),
                SizedBox(width: widthSizer(9, context)),
                const Icon(
                  IWishIcons.arrow_down_circle,
                  size: 18,
                  color: AppColors.lightPurple,
                )
              ],
            ),
          ),
          SizedBox(height: heightSizer(36, context)),
          const IWishVoucherSection(),
          SizedBox(height: heightSizer(48, context)),
          const ProductDetailsSection(),
          SizedBox(height: heightSizer(48, context)),
          GeneralButton(
              textFontSize: widthSizer(16, context),
              textFontWeight: FontWeight.w400,
              buttonText: 'Continue',
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.checkOutScreen,
                    arguments: true);
              }),
          SizedBox(height: heightSizer(24, context)),
          GeneralButton(
              textFontSize: widthSizer(16, context),
              textFontWeight: FontWeight.w700,
              buttonColor: Colors.white,
              textColor: AppColors.primaryColor,
              buttonText: 'Add More Items',
              onPressed: () {}),
          // SizedBox(height: heightSizer(12, context)),
        ]),
      ),
    );
  }
}
