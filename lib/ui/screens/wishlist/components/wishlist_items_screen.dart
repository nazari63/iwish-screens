import 'package:flutter/material.dart';
import 'package:wish_list/models/wish_list_items.dart';
import 'package:wish_list/ui/widgets/custom_app_bar.dart';
import 'package:wish_list/ui/widgets/custom_back_button.dart';

import '../../../../models/wish_list_items.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../../utils/i_wish_icons.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/bottom_nav.dart';
import '../../../widgets/custom_grid_view.dart';
import '../../../widgets/drawer_menu.dart';
import '../../../widgets/search_bar.dart';
import '../../../widgets/wishlist_item.dart';

class WishListItemsScreen extends StatelessWidget {
  const WishListItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerMenu(),
        backgroundColor: Colors.white,
        appBar: const AppBarWithActions(),
        body: WisherBottomNav(
          currentNavParent: BottomNavParent.wishList,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(widthSizer(24, context)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const CustomBackButton(label: 'Home', padding: EdgeInsets.zero),
              SizedBox(height: heightSizer(24, context)),
              Text('Wishlist Items',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: widthSizer(32, context))),
              SizedBox(height: heightSizer(24, context)),
              const SearchBar(),
              SizedBox(height: heightSizer(24, context)),
              CustomGridView(
                  crossAxisCount: 2,
                  rowGap: 24,
                  columnGap: widthSizer(20, context),
                  items: List.generate(
                      WishListItem.demoItems.length,
                      (index) => WishListItemWidget(
                            item: WishListItem.demoItems[index],
                            onPressed: () {},
                          ))),
              // GridView.builder(
              //     shrinkWrap: true,
              //     padding: EdgeInsets.zero,
              //     physics: const NeverScrollableScrollPhysics(),
              //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 2,
              //         crossAxisSpacing: 24,
              //         mainAxisSpacing: 24,
              //         childAspectRatio: .7),
              //     itemCount: WishListItem.demoItems.length,
              //     itemBuilder: (context, index) => WishListItemWidget(
              //           item: WishListItem.demoItems[index],
              //           iconBackgroundColor: AppColors.textBlack,
              //         )),
              SizedBox(height: heightSizer(40, context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Load more',
                      style: AppTextStyles.mediumBodyText(context)),
                  SizedBox(
                    width: widthSizer(9, context),
                  ),
                  const Icon(
                    IWishIcons.arrow_down_circle,
                    size: 17,
                  )
                ],
              )
            ]),
          ),
        ));
  }
}
