import 'package:flutter/material.dart';
import 'package:wish_list/models/wish_list_items.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';
import '../../utils/i_wish_icons.dart';
import '../../utils/router/route_names.dart';
import '../../utils/widget_size_utils.dart';

class VendorProductWidget extends StatelessWidget {
  final WishListItem item;
  final Color iconBackgroundColor;

  const VendorProductWidget(
      {Key? key,
      required this.item,
      this.iconBackgroundColor = AppColors.primaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widthSizer(152, context),
        height: heightSizer(210, context),
        decoration: BoxDecoration(
            color: const Color(0xFFE5E0E9),
            borderRadius: BorderRadius.circular(8)),
        child: GestureDetector(
          onTap: () =>
              Navigator.pushNamed(context, RouteNames.vendorViewProductScreen),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topRight,
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
                child: const Align(
                  alignment: Alignment.topRight,
                  child: _VendorProductOptionPopUpMenu(),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: AppColors.bgColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8))),
                  padding: const EdgeInsets.symmetric(horizontal: 9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
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
                      SizedBox(height: heightSizer(24, context)),
                      Row(
                        children: [
                          Text(
                            'Left in stock',
                            style: AppTextStyles.heading2(context)
                                .copyWith(fontSize: 12),
                          ),
                          SizedBox(width: widthSizer(7, context)),
                          Text(
                            '12/30',
                            style: AppTextStyles.mediumBodyText(context),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class _VendorProductOptionPopUpMenu extends StatelessWidget {
  const _VendorProductOptionPopUpMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widthSizer(8, context)),
          color: const Color(0xFF080016),
        ),
        child: PopupMenuButton(
            offset: const Offset(0, -24),
            constraints: BoxConstraints(
                minHeight: heightSizer(119, context),
                maxHeight: heightSizer(119, context),
                maxWidth: widthSizer(129, context),
                minWidth: widthSizer(129, context)),
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.more_horiz,
              color: Colors.white,
              size: 14,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: const Color(0xFF080016),
            elevation: 5,
            position: PopupMenuPosition.under,
            enabled: true,
            onSelected: (value) {
              // setState(() {});
            },
            itemBuilder: (context) => [
                  const PopupMenuItem(
                    padding: EdgeInsets.zero,
                    value: 0,
                    height: 12,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        IWishIcons.carbon_close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 1,
                    padding: const EdgeInsets.only(left: 15, bottom: 12),
                    height: 20,
                    child: Text(
                      "Edit product",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: widthSizer(14, context)),
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
                    padding: const EdgeInsets.only(left: 15, bottom: 12),
                    height: 20,
                    child: Text(
                      "Delete product",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: widthSizer(14, context)),
                    ),
                  ),
                ]));
  }
}
