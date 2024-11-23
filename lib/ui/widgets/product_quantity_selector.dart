import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wish_list/models/product.dart';
import 'package:wish_list/utils/app_colors.dart';
import 'package:wish_list/utils/app_text_styles.dart';

import '../../utils/i_wish_icons.dart';
import '../../utils/widget_size_utils.dart';

class ProductQuantitySelector extends StatelessWidget {
  final Product product;
  // final double width;
  final double height;

  const ProductQuantitySelector(
      {Key? key,
      required this.product,
      // this.width = 110,
      this.height = 45})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Product>.value(
        value: product,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF959494), width: 2),
                borderRadius: BorderRadius.circular(8)),
            height: heightSizer(height, context),
            child: Consumer<Product>(
              builder: (context, model, child) {
                return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _InCreaseDecreaseButton(
                          icon: IWishIcons.fluent_subtract_16_regular,
                          product: model,
                          onPressed: product.cartQuantity > 0
                              ? model.decreaseCartQuantity
                              : null),
                      Text(model.cartQuantity.toString(),
                          style: AppTextStyles.bodyText(context).copyWith(
                            color: const Color(0xFF333333),
                          )),
                      _InCreaseDecreaseButton(
                          icon: IWishIcons.fluent_add_16_regular,
                          product: model,
                          onPressed:
                              product.cartQuantity < product.availableQuantity
                                  ? model.increaseCartQuantity
                                  : null)
                    ]);
              },
            ),
          );
        });
  }
}

class _InCreaseDecreaseButton extends StatelessWidget {
  const _InCreaseDecreaseButton({
    Key? key,
    required this.product,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  final Product product;

  /// passing null, disables the button
  final VoidCallback? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        visualDensity: VisualDensity.compact,
        disabledColor: AppColors.grey,
        color: AppColors.textBlack,
        icon: Icon(
          icon,
          size: 20,
        ));
  }
}
