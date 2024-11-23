import 'package:flutter/material.dart';
import 'package:wish_list/models/wish_list_items.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';
import '../../utils/i_wish_icons.dart';
import '../../utils/router/route_names.dart';
import '../../utils/widget_size_utils.dart';
import 'icon_container.dart';

class GiftBoxItemWidget extends StatelessWidget {
  final WishListItem item;
  final Color iconBackgroundColor;

  const GiftBoxItemWidget(
      {Key? key,
      required this.item,
      this.iconBackgroundColor = AppColors.primaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteNames.productDescription, arguments: true);
      },
      child: Container(
          width: widthSizer(152, context),
          padding: EdgeInsets.only(bottom: heightSizer(16, context)),
          // height: 176,
          decoration: BoxDecoration(
              color: const Color(0xFFE5E0E9),
              borderRadius: BorderRadius.circular(8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
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
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: widthSizer(9, context),
                      right: widthSizer(4, context),
                      top: heightSizer(14, context),
                      bottom: heightSizer(14, context)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.mediumBodyText(context)
                                  .copyWith(color: AppColors.textBlack),
                            ),
                            SizedBox(height: heightSizer(6, context)),
                            Text(
                              '#${item.priceString}',
                              style: AppTextStyles.heading4(context),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   width: widthSizer(14, context),
                      // ),
                      IconContainer(
                        width: widthSizer(40, context),
                        child: const Icon(
                          IWishIcons.fluent_gift_card_add_20_regular,
                          color: Colors.white,
                          size: 18,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
