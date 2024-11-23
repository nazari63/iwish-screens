import 'package:flutter/material.dart';
import 'package:wish_list/ui/widgets/general_button.dart';

import '../../../../models/product.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../../utils/router/route_names.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/iWish_voucher_widget.dart';
import '../../../widgets/product_details_section.dart';
import '../../../widgets/product_widget_with_quantity_selector.dart';

class GrantWishProductDetailsScreen extends StatelessWidget {
  final Product product;

  const GrantWishProductDetailsScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarWithBackButton(
          title: Text(
            'Grant Wish',
            style: AppTextStyles.heading4(context),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(widthSizer(24, context)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: heightSizer(24, context)),
            ProductWithQuantitySelectorWidget(
              product: product,
              forCart: false,
            ),
            SizedBox(height: heightSizer(47, context)),
            const IWishVoucherSection(),
            SizedBox(height: heightSizer(48, context)),
            const ProductDetailsSection(),
            SizedBox(height: heightSizer(48, context)),
            GeneralButton(
                textFontSize: widthSizer(16, context),
                textFontWeight: FontWeight.w400,
                buttonText: 'Continue',
                onPressed: () {
                  Navigator.pushNamed(
                      context, RouteNames.grantWishPaymentMethodScreen);
                }),
            SizedBox(height: heightSizer(24, context)),
          ]),
        ));
  }
}
