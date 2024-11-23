import 'package:flutter/material.dart';
import 'package:wish_list/models/wish_list.dart';
import 'package:wish_list/utils/app_text_styles.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/i_wish_icons.dart';
import '../../../../utils/router/route_names.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/search_bar.dart';
import '../../../widgets/wishlist_card.dart';

class MyWishListScreen extends StatelessWidget {
  const MyWishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.all(24),
        shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Wishlist',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: widthSizer(24, context))),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.createWishListScreen);
                },
                child: Container(
                  padding: EdgeInsets.all(widthSizer(12, context)),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: const [
                      Icon(
                        IWishIcons.fluent_add_16_regular,
                        color: Colors.white,
                        size: 18,
                      ),
                      Text(
                        'New',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: heightSizer(12, context)),
          const SearchBar(),
          SizedBox(height: heightSizer(24, context)),
          const Align(
            alignment: Alignment.centerLeft,
            child: _ApplyFilterPopUpMenu(),
          ),
          SizedBox(height: heightSizer(24, context)),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: WishList.demoList.length,
            itemBuilder: (context, index) => WishListCard(
              wishList: WishList.demoList[index],
            ),
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: heightSizer(24, context));
            },
          ),
        ]);
  }
}

class _ApplyFilterPopUpMenu extends StatelessWidget {
  const _ApplyFilterPopUpMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: Colors.white,
        elevation: 5,
        enabled: true,
        position: PopupMenuPosition.under,
        offset: const Offset(0, 10),
        itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                // padding: EdgeInsets.zero,
                child: Text(
                  "Pending Wish",
                  style: TextStyle(
                      color: AppColors.textBlack,
                      fontSize: widthSizer(16, context)),
                ),
              ),
              const PopupMenuItem(
                enabled: false,
                padding: EdgeInsets.zero,
                height: 10,
                child: Divider(),
              ),
              PopupMenuItem(
                value: 2,
                // padding: const EdgeInsets.all(16),
                child: Text(
                  "Granted Wish",
                  style: TextStyle(
                      color: AppColors.textBlack,
                      fontSize: widthSizer(14, context)),
                ),
              )
            ],
        child: Container(
          alignment: Alignment.center,
          width: widthSizer(139, context),
          padding: EdgeInsets.all(widthSizer(10, context)),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFDCC1FF))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(IWishIcons.fluent_add_16_regular, size: 18),
              SizedBox(width: widthSizer(10, context)),
              Text(
                'Apply Filter',
                style: AppTextStyles.bodyText(context)
                    .copyWith(color: AppColors.textBlack),
              )
            ],
          ),
        ));
  }
}
