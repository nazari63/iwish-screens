import 'package:flutter/material.dart';
import 'package:wish_list/utils/app_colors.dart';

import '../../../../models/product.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../../utils/i_wish_icons.dart';
import '../../../../utils/router/route_names.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/icon_container.dart';

class SelectGrantWishModeDialog extends StatelessWidget {
  final Product product;

  static show(BuildContext context, Product selectedProduct) {
    showDialog(
        context: context,
        barrierColor: const Color(0xFF4F4F4F).withOpacity(0.5),
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SelectGrantWishModeDialog._(
            product: selectedProduct,
          );
        });
  }

  const SelectGrantWishModeDialog._({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: widthSizer(1, context)),
      elevation: 0,
      backgroundColor: const Color(0xFF4F4F4F).withOpacity(0.5),
      child: Container(
        // padding: EdgeInsets.symmetric(horizontal: widthSizer(24, context)),
        height: heightSizer(403, context),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widthSizer(8, context)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: const Color(0xFFAEAEAE).withOpacity(0.15),
                  blurRadius: 40,
                  offset: const Offset(0, 8))
            ]),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(
                  top: heightSizer(12, context),
                  right: widthSizer(22, context)),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: IconContainer(
                  width: widthSizer(40, context),
                  child: const Icon(
                    IWishIcons.carbon_close,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: heightSizer(11, context)),
          Align(
            alignment: Alignment.center,
            child: Text('Grant wish', style: AppTextStyles.heading2(context)),
          ),
          SizedBox(height: heightSizer(48, context)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widthSizer(24, context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _GrantWishDialogButton(
                    product: product,
                    title: 'i-Wish Store',
                    description:
                        'Grant wish from the list of items from our wishlist store.',
                    icon: Image.asset(
                      'assets/images/shopping_cart_with_star_with_background.png',
                      fit: BoxFit.scaleDown,
                    ),
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, RouteNames.grantWishProductDescriptionScreen,
                          arguments: product);
                    }),
                _GrantWishDialogButton(
                    product: product,
                    title: 'Send Money',
                    description:
                        'Send part or equivalent amount of money to recipient.',
                    icon: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.bgColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Icon(
                        IWishIcons.fluent_money_24_regular,
                        size: widthSizer(33.33, context),
                        color: AppColors.primaryColor,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, RouteNames.sendCashEquivalentScreen,
                          arguments: product);
                    }),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class _GrantWishDialogButton extends StatelessWidget {
  const _GrantWishDialogButton({
    Key? key,
    required this.product,
    required this.onTap,
    required this.title,
    required this.description,
    required this.icon,
  }) : super(key: key);

  final Product product;
  final VoidCallback onTap;
  final String title;
  final String description;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: widthSizer(8, context)),
        width: widthSizer(157, context),
        height: heightSizer(169, context),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widthSizer(8, context)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: const Color(0xFFAEAEAE).withOpacity(0.15),
                  blurRadius: 20,
                  offset: const Offset(0, 8))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: widthSizer(40, context),
              height: heightSizer(40, context),
              child: icon,
            ),
            SizedBox(height: heightSizer(12, context)),
            Text(title,
                style: AppTextStyles.heading4(context)
                    .copyWith(color: const Color(0xFF282828))),
            SizedBox(height: heightSizer(6, context)),
            Text(description,
                textAlign: TextAlign.center,
                style: AppTextStyles.mediumBodyText(context)
                    .copyWith(color: AppColors.textBlack))
          ],
        ),
      ),
    );
  }
}
