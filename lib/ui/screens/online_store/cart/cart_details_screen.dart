import 'package:flutter/material.dart';
import 'package:wish_list/ui/widgets/general_button.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../../utils/router/route_names.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/custom_back_button.dart';
import '../../../widgets/iWish_voucher_widget.dart';
import '../../../widgets/product_details_section.dart';
import '../components/cart_items_list.dart';

class CartDetailsScreen extends StatelessWidget {
  const CartDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.all(widthSizer(24, context)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const CustomBackButton(padding: EdgeInsets.zero),
            SizedBox(height: heightSizer(24, context)),
            Text('View Cart', style: AppTextStyles.heading2(context)),
            SizedBox(height: heightSizer(24, context)),
            const CartItemsList(),
            SizedBox(height: heightSizer(48, context)),
            const IWishVoucherSection(),
            SizedBox(height: heightSizer(48, context)),
            const ProductDetailsSection(),
            SizedBox(height: heightSizer(48, context)),
            GeneralButton(
                textFontSize: widthSizer(16, context),
                textFontWeight: FontWeight.w400,
                buttonText: 'Continue',
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.checkOutScreen, arguments: false);
                }),
            SizedBox(height: heightSizer(24, context)),
            GeneralButton(
                textFontSize: widthSizer(16, context),
                textFontWeight: FontWeight.w700,
                buttonColor: Colors.white,
                textColor: AppColors.primaryColor,
                buttonText: 'Buy More Items',
                onPressed: () {}),
            SizedBox(height: heightSizer(12, context)),
          ])),
    );
  }
}
