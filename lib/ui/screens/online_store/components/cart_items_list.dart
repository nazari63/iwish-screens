import 'package:flutter/material.dart';

import '../../../../models/product.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/product_widget_with_quantity_selector.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) =>
            ProductWithQuantitySelectorWidget(product: Product.cart[index]),
        separatorBuilder: (context, index) => SizedBox(
              height: heightSizer(24, context),
            ),
        itemCount: Product.cart.length);
  }
}
