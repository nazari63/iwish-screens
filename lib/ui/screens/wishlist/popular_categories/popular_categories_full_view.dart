import 'package:flutter/material.dart';
import 'package:wish_list/ui/widgets/custom_app_bar.dart';
import 'package:wish_list/utils/app_text_styles.dart';

import '../../../../models/wish_list_items.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/i_wish_icons.dart';
import '../../../../utils/router/route_names.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/bottom_nav.dart';
import '../../../widgets/custom_back_button.dart';
import '../../../widgets/custom_grid_view.dart';
import '../../../widgets/drawer_menu.dart';
import '../../../widgets/search_bar.dart';
import '../../../widgets/wishlist_item.dart';

class PopularCategoriesFullView extends StatelessWidget {
  final String category;

  const PopularCategoriesFullView({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(GiftBoxScreenViewModel.GiftBoxes);
    return Scaffold(
        drawer: const DrawerMenu(),
        backgroundColor: Colors.white,
        appBar: const AppBarWithActions(),
        body: WisherBottomNav(
            currentNavParent: BottomNavParent.wishList,
            // Mocking the GiftBox UI using a stack
            child: Stack(
              children: [
                SingleChildScrollView(
                  padding: EdgeInsets.only(left: widthSizer(24, context)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: heightSizer(24, context)),
                        const CustomBackButton(
                          label: 'Home',
                          padding: EdgeInsets.zero,
                          backRoute: RouteNames.homeScreen,
                        ),
                        SizedBox(height: heightSizer(24, context)),
                        Text(category,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: widthSizer(32, context))),
                        SizedBox(height: heightSizer(24, context)),
                        const Padding(
                          padding: EdgeInsets.only(right: 24.0),
                          child: SearchBar(),
                        ),
                        SizedBox(height: heightSizer(24, context)),
                        const _CategorySection(),
                        SizedBox(height: heightSizer(36, context)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Load more',
                                style: AppTextStyles.mediumBodyText(context)),
                            SizedBox(width: widthSizer(9, context)),
                            const Icon(
                              IWishIcons.arrow_down_circle,
                              size: 17,
                            )
                          ],
                        ),
                        SizedBox(height: heightSizer(66, context)),
                      ]),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: widthSizer(182, context),
                      height: heightSizer(46, context),
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                          color: const Color(0xFFFFCC00),
                          borderRadius:
                              BorderRadius.circular(widthSizer(50, context))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            IWishIcons.fluent_wand_16_regular,
                            color: AppColors.primaryColor,
                            size: 30,
                          ),
                          SizedBox(width: widthSizer(8, context)),
                          Text('View Wishlist',
                              style: AppTextStyles.mediumBodyText(context)
                                  .copyWith(color: AppColors.primaryColor))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )));
  }
}

class _CategorySection extends StatelessWidget {
  const _CategorySection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomGridView(
        crossAxisCount: 2,
        rowGap: 24,
        columnGap: widthSizer(20, context),
        items: List.generate(
            4,
            (index) => WishListItemWidget(
                  item: WishListItem.demoItems[index],
                  iconBackgroundColor: AppColors.textBlack, onPressed: () {  },
                )));
  }
}
