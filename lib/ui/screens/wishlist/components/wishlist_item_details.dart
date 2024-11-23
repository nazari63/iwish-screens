import 'package:flutter/material.dart';
import 'package:wish_list/ui/widgets/custom_back_button.dart';
import 'package:wish_list/utils/app_text_styles.dart';

import '../../../../models/wish_list_items.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/i_wish_icons.dart';
import '../../../../utils/router/route_names.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/general_button.dart';
import 'delete_wishlist_dialog.dart';
import 'share_option_dialog.dart';

class WishlistItemDetails extends StatelessWidget {
  final WishListItem wishListItem;
  const WishlistItemDetails({Key? key, required this.wishListItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(widthSizer(24, context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomBackButton(
                  label: 'Wishlist items',
                  padding: EdgeInsets.zero,
                ),
                GestureDetector(
                  onTap: () {
                    ShareOptionDialog.show(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    width: widthSizer(140, context),
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          IWishIcons.fluent_share_16_regular,
                          color: Colors.white,
                          size: 14,
                        ),
                        SizedBox(width: widthSizer(6, context)),
                        Text(
                          'Share',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: widthSizer(16, context)),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: heightSizer(18, context)),
            Container(
              height: heightSizer(200, context),
              width: ScreenSize.width(context),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(wishListItem.imageUrl),
                  ),
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(8)),
            ),
            SizedBox(height: heightSizer(12, context)),
            Text(
              wishListItem.name,
              style: AppTextStyles.heading3(context),
            ),
            SizedBox(height: heightSizer(24, context)),
            Text(
              'Item Details',
              style: AppTextStyles.heading4(context),
            ),
            SizedBox(height: heightSizer(15, context)),
            const _ItemDetailsTile(
              title: 'Wishlist',
              value: 'My wishlist for birthday',
            ),
            SizedBox(height: heightSizer(12, context)),
            _ItemDetailsTile(
              title: 'Price',
              value: '#${wishListItem.priceString}',
            ),
            SizedBox(height: heightSizer(12, context)),
            _ItemDetailsTile(
              title: 'Wish status',
              value: wishListItem.isGranted ? 'Granted' : 'Pending',
            ),
            SizedBox(height: heightSizer(24, context)),
            GeneralButton(
                buttonText: 'Edit Item',
                onPressed: () {
                  Navigator.pushNamed(
                      context, RouteNames.editWishListItemScreen,
                      arguments: wishListItem);
                }),
            SizedBox(height: heightSizer(12, context)),
            GeneralButton(
                buttonText: 'Delete Item',
                buttonColor: Colors.transparent,
                textColor: AppColors.primaryColor,
                textFontWeight: FontWeight.w700,
                textFontSize: widthSizer(16, context),
                onPressed: () {
                  DeleteWishlistDialog.show(context);
                }),
          ],
        ),
      )),
    );
  }
}

class _ItemDetailsTile extends StatelessWidget {
  const _ItemDetailsTile({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: widthSizer(16, context)),
        ),
        Text(
          value,
          style: AppTextStyles.mediumBodyText(context)
              .copyWith(color: const Color(0xFF4F4F4F)),
        ),
      ],
    );
  }
}
