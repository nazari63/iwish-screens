import 'package:flutter/material.dart';

import '../../../../models/product.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../../utils/i_wish_icons.dart';
import '../../../../utils/router/route_names.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/general_button.dart';
import '../../../widgets/icon_container.dart';

class ItemUnavailableDialog extends StatelessWidget {
  final Product product;

  static show(BuildContext context, Product selectedProduct) {
    showDialog(
        context: context,
        barrierColor: const Color(0xFF4F4F4F).withOpacity(0.5),
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ItemUnavailableDialog._(
            product: selectedProduct,
          );
        });
  }

  const ItemUnavailableDialog._({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      elevation: 0,
      backgroundColor: const Color(0xFF4F4F4F).withOpacity(0.5),
      child: Container(
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
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox.square(
                  dimension: widthSizer(60, context),
                  child: Image.asset(
                    'assets/images/shopping_cart_with_star_with_background.png',
                    fit: BoxFit.scaleDown,
                  ),
                ),
                SizedBox(height: heightSizer(12, context)),
                Text('Item is Currently unavailable',
                    style: AppTextStyles.heading4(context)),
                SizedBox(height: heightSizer(12, context)),
                Text("We’re unable to help you grant Ejoke’s wish right now",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.mediumBodyText(context)),
                SizedBox(height: heightSizer(34, context)),
                GeneralButton(
                  buttonText: 'Send Cash Equivalent',
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, RouteNames.sendCashEquivalentScreen,
                        arguments: product);
                  },
                  width: widthSizer(327, context),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
