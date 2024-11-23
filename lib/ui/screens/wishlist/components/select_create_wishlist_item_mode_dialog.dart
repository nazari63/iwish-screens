import 'package:flutter/material.dart';
import 'package:wish_list/ui/widgets/icon_container.dart';
import 'package:wish_list/utils/app_colors.dart';
import 'package:wish_list/utils/app_text_styles.dart';

import '../../../../utils/i_wish_icons.dart';
import '../../../../utils/router/route_names.dart';
import '../../../../utils/widget_size_utils.dart';

class SelectCreateWishListItemModeDialog extends StatelessWidget {
  static show(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return const SelectCreateWishListItemModeDialog._();
        });
  }

  const SelectCreateWishListItemModeDialog._({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white70,
      insetPadding: const EdgeInsets.all(24),
      child: Container(
        height: heightSizer(456, context),
        width: widthSizer(327, context),

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 12),
                color: Color(0xFFE7E7E7),
                blurRadius: 40,
              )
            ]),
        child: Stack(
          children: [
            Positioned(
                bottom: 0,
                child: Container(
                    width: widthSizer(327, context),
                    height: heightSizer(150, context),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8)),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                                    'assets/images/select-create-items-mode-design.png'))))),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, right: 12.0),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: IconContainer(
                          backgroundColor: AppColors.primaryColor,
                          width: widthSizer(40, context),
                          child: const Icon(IWishIcons.carbon_close,
                              color: Colors.white),
                        ),
                      )),
                ),
                SizedBox(height: heightSizer(40, context)),
                Text(
                  'Create Items',
                  style: AppTextStyles.heading2(context)
                      .copyWith(color: AppColors.textBlack),
                ),
                SizedBox(height: heightSizer(12, context)),
                Text('Select how you want to make a wish',
                    style: AppTextStyles.mediumBodyText(context)
                        .copyWith(color: AppColors.textBlack)),
                SizedBox(height: heightSizer(27, context)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        /// Pop Dialog then navigate to next screen
                        Navigator.pop(context);
                        Navigator.pushNamed(
                            context, RouteNames.wishListItemsScreen);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: widthSizer(100, context),
                            height: heightSizer(100, context),
                            child: Image.asset(
                              'assets/images/shopping_cart_with_star_with_background.png',
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          SizedBox(height: heightSizer(12, context)),
                          SizedBox(
                            width: widthSizer(130, context),
                            child: Text(
                              'Choose from our wishlist store',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.mediumBodyText(context)
                                  .copyWith(color: AppColors.textBlack),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: widthSizer(19, context)),
                    GestureDetector(
                      onTap: () {
                        /// Pop Dialog then navigate to next screen
                        Navigator.pushReplacementNamed(
                            context, RouteNames.createWishListItemScreen);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: widthSizer(100, context),
                            height: heightSizer(100, context),
                            child: Image.asset(
                              'assets/images/black_and_purple_magic_wand_with_background.png',
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          SizedBox(height: heightSizer(12, context)),
                          SizedBox(
                            width: widthSizer(130, context),
                            child: Text(
                              'Create your custom wishlist item',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.mediumBodyText(context)
                                  .copyWith(color: AppColors.textBlack),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
