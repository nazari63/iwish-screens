import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wish_list/ui/screens/wishlist/components/select_create_wishlist_item_mode_dialog.dart';
import 'package:wish_list/ui/screens/wishlist/components/share_option_dialog.dart';
import 'package:wish_list/ui/screens/wishlist/wishlist_viewmodel.dart';
import 'package:wish_list/utils/service_locator.dart';

import '../../../../models/wish_list_items.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../../utils/i_wish_icons.dart';
import '../../../../utils/router/route_names.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/custom_back_button.dart';
import 'empty_wishlist.dart';

class WishlistDetailsScreen extends StatelessWidget {
  const WishlistDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WishListViewModel>.value(
        value: serviceLocator<WishListViewModel>(),
        child: Consumer<WishListViewModel>(
          builder: (context, viewModel, child) {
            return Visibility(
                visible: viewModel.hasWishListItem,
                replacement: const EmptyWishlistView(),
                child: const _WishListDetailsView());
          },
        ));
  }
}

/// Gets displayed when the wishlist is not empty. i.e the wish list has items
class _WishListDetailsView extends StatelessWidget {
  const _WishListDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomBackButton(padding: EdgeInsets.zero),
                GestureDetector(
                  onTap: () {
                    ShareOptionDialog.show(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(widthSizer(12, context)),
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          IWishIcons.fluent_share_16_regular,
                          color: Colors.white,
                          size: 14,
                        ),
                        SizedBox(width: widthSizer(7, context)),
                        Text(
                          'Share',
                          style: AppTextStyles.mediumBodyText(context)
                              .copyWith(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: heightSizer(10, context)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My birthday wishlist',
                      style: TextStyle(
                          color: const Color(0xFF4F4F4F),
                          fontWeight: FontWeight.w400,
                          fontSize: widthSizer(14, context)),
                    ),
                    Text(
                      'Wishlist Items',
                      style: TextStyle(
                          color: const Color(0xFF333333),
                          fontWeight: FontWeight.w700,
                          fontSize: widthSizer(24, context)),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    SelectCreateWishListItemModeDialog.show(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        const Icon(
                          IWishIcons.fluent_add_16_regular,
                          color: AppColors.primaryColor,
                          size: 16,
                        ),
                        Text(
                          'New',
                          style: TextStyle(
                              fontSize: widthSizer(14, context),
                              color: AppColors.primaryColor),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: heightSizer(24, context)),
            GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: heightSizer(20, context),
                    crossAxisSpacing: widthSizer(18, context),
                    childAspectRatio: 4),
                itemCount: WishListItem.demoItems.length,
                itemBuilder: (context, index) {
                  final wishListItem = WishListItem.demoItems[index];
                  return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteNames.wishlistItemDetails,
                            arguments: wishListItem);
                      },
                      child: _WishListItem(wishListItem: wishListItem));
                }),
          ],
        ),
      )),
    );
  }
}

class _WishListItem extends StatelessWidget {
  const _WishListItem({
    Key? key,
    required this.wishListItem,
  }) : super(key: key);

  final WishListItem wishListItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthSizer(158, context),
      // height: heightSizer(40, context),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox.square(
            dimension: widthSizer(40, context),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network('https://picsum.photos/200'),
            ),
          ),
          SizedBox(width: widthSizer(8, context)),
          SizedBox(
            width: widthSizer(106, context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  wishListItem.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      height: 1.12,
                      fontSize: widthSizer(16, context)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: wishListItem.isGranted
                              ? Colors.green
                              : Colors.yellow),
                    ),
                    SizedBox(width: widthSizer(6, context)),
                    Text(
                      wishListItem.isGranted ? 'Granted' : 'Pending',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: widthSizer(12, context)),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
