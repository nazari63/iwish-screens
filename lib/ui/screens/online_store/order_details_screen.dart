import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wish_list/ui/widgets/custom_app_bar.dart';
import 'package:wish_list/ui/widgets/general_button.dart';
import 'package:wish_list/ui/widgets/product_details_section.dart';

import '../../../models/product.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../../../utils/router/route_names.dart';
import '../../../utils/widget_size_utils.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWithBackButton(
          backButtonText: 'Home', backRoute: RouteNames.homeScreen),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(widthSizer(24, context)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Order Details',
                style: AppTextStyles.heading2(context),
              ),
              SizedBox(height: heightSizer(24, context)),
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      _OrderItem(product: Product.cart[index]),
                  separatorBuilder: (context, index) =>
                      SizedBox(height: heightSizer(24, context)),
                  itemCount: Product.cart.length),
              SizedBox(height: heightSizer(48, context)),
              const ProductDetailsSection(),
              SizedBox(height: heightSizer(48, context)),
              GeneralButton(
                  textFontSize: widthSizer(16, context),
                  textFontWeight: FontWeight.w400,
                  buttonText: 'Download Receipt',
                  onPressed: () {}),
              SizedBox(height: heightSizer(6, context)),
              GeneralButton(
                  textFontSize: widthSizer(16, context),
                  textFontWeight: FontWeight.w700,
                  buttonColor: Colors.white,
                  textColor: AppColors.primaryColor,
                  buttonText: 'Track Order',
                  onPressed: () {
                    Navigator.pushNamed(context, RouteNames.trackOrderScreen);
                  }),
            ])),
      ),
    );
  }
}

class _OrderItem extends StatelessWidget {
  final Product product;

  const _OrderItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Product>.value(
        value: product,
        child: Consumer<Product>(
          builder: (context, model, child) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: widthSizer(110, context),
                height: heightSizer(110, context),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(product.productImages[0]),
                    ),
                    color: const Color(0xFFF8F8F8),
                    borderRadius: BorderRadius.circular(8)),
              ),
              SizedBox(width: widthSizer(12, context)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name, style: AppTextStyles.heading4(context)),
                    SizedBox(height: heightSizer(12, context)),
                    Row(
                      children: [
                        Text(
                          'Quantity',
                          style: AppTextStyles.mediumBodyText(context)
                              .copyWith(color: const Color(0xFF333333)),
                        ),
                        SizedBox(width: widthSizer(40, context)),
                        Text(
                          product.availableQuantity.toString(),
                          style: AppTextStyles.mediumBodyText(context)
                              .copyWith(color: const Color(0xFF333333)),
                        )
                      ],
                    ),
                    SizedBox(height: heightSizer(12, context)),
                    Text(
                      'Total # ${model.totalPriceString}',
                      style: AppTextStyles.mediumBodyText(context)
                          .copyWith(color: const Color(0xFF333333)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
