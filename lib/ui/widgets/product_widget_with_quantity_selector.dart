import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wish_list/ui/widgets/product_quantity_selector.dart';

import '../../models/product.dart';
import '../../utils/app_text_styles.dart';
import '../../utils/i_wish_icons.dart';
import '../../utils/widget_size_utils.dart';
import 'icon_container.dart';

class ProductWithQuantitySelectorWidget extends StatelessWidget {
  final Product product;
  final bool forCart;

  const ProductWithQuantitySelectorWidget(
      {Key? key, required this.product, this.forCart = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Product>.value(
        value: product,
        child: Consumer<Product>(
          builder: (context, model, child) => Row(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProductQuantitySelector(product: product),
                        Visibility(
                            visible: forCart,
                            replacement: const Spacer(),
                            child: IconContainer(
                              width: widthSizer(39, context),
                              backgroundColor: const Color(0xFFFF2B2B),
                              height: 40,
                              child: const Icon(
                                IWishIcons.fluent_delete_16_regular,
                                color: Colors.white,
                                size: 20,
                              ),
                            )),
                      ],
                    ),
                    SizedBox(height: heightSizer(12, context)),
                    Text('Total # ${model.totalPriceString}',
                        style: AppTextStyles.mediumBodyText(context)),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
