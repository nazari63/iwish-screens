import 'package:flutter/material.dart';
import 'package:wish_list/models/wish_list_items.dart';

import '../../utils/app_colors.dart';
import '../../utils/i_wish_icons.dart';
import '../../utils/router/route_names.dart';
import '../../utils/widget_size_utils.dart';
import 'general_button.dart';
import 'icon_container.dart';

class WishListItemWidget extends StatelessWidget {
  final WishListItem item;
  final Color iconBackgroundColor;
  final bool forGrantWish;
  final bool forCart;
  final void Function() onPressed;

  WishListItemWidget(
      {Key? key,
      required this.item,
      this.iconBackgroundColor = AppColors.primaryColor,
      this.forGrantWish = false,
      this.forCart = false,
      required this.onPressed})
      : super(key: key);
  String buttonText = 'Add to Wishlist';

  @override
  Widget build(BuildContext context) {
    if (forGrantWish) {
      buttonText = 'Grant Wish';
    } else if (forCart) {
      buttonText = 'Add to Cart';
    }
    return Container(
        width: widthSizer(152, context),
        height: heightSizer(226, context),
        decoration: BoxDecoration(
            color: const Color(0xFFE5E0E9),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(
                  context, RouteNames.productDescription,
                  arguments: false),
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(6),
                width: widthSizer(152, context),
                height: heightSizer(106, context),
                decoration: BoxDecoration(
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage('https://picsum.photos/200'),
                    ),
                    color: const Color(0xFFF8F8F8),
                    borderRadius: BorderRadius.circular(8)),
                child: Visibility(
                  visible: !forCart,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconContainer(
                        backgroundColor: iconBackgroundColor,
                        width: 28,
                        child: const Icon(
                          IWishIcons.fluent_cart_16_regular,
                          color: Colors.white,
                          size: 18,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xFFE5E0E9),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8))),
                padding: const EdgeInsets.symmetric(
                  horizontal: 9,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: widthSizer(14, context)),
                    ),
                    SizedBox(height: heightSizer(6, context)),
                    Text(
                      '#${item.priceString}',
                      style: TextStyle(
                          fontSize: widthSizer(16, context),
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: heightSizer(20, context)),
                    GeneralButton(
                      buttonText: buttonText,
                      onPressed: onPressed,
                      height: heightSizer(37, context),
                      textFontSize: widthSizer(12, context),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
