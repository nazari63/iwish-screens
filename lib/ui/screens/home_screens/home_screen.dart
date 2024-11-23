import 'package:flutter/material.dart';
import 'package:wish_list/ui/widgets/custom_app_bar.dart';
import 'package:wish_list/utils/i_wish_icons.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/router/route_names.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../models/wish_list.dart';
import '../../../models/wish_list_items.dart';
import '../../widgets/bottom_nav.dart';
import '../../widgets/category_item.dart';
import '../../widgets/drawer_menu.dart';
import '../../widgets/search_bar.dart';
import '../../widgets/wishlist_item.dart';
import 'home_screen_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerMenu(),
        backgroundColor: Colors.white,
        appBar: const AppBarWithActions(),
        body: WisherBottomNav(
            currentNavParent: BottomNavParent.home,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                      top: heightSizer(24, context),
                      left: widthSizer(24, context),
                    ),
                    child: ListView(children: [
                      Text('Wishlist Store',
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
                      const _PopularCategoriesSection(),
                      SizedBox(height: heightSizer(48, context)),
                      const _WishListItemsSection(),
                      SizedBox(height: heightSizer(48, context)),
                      const _MyWishListsSection()
                    ]),
                  ),
                )
              ],
            )));
  }
}

class _MyWishListsSection extends StatelessWidget {
  const _MyWishListsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Wishlist',
                style: TextStyle(
                    fontSize: widthSizer(16, context),
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              _ViewAllButton(
                  color: AppColors.textBlack,
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.wishListScreen);
                  }),
            ],
          ),
        ),
        SizedBox(height: heightSizer(24, context)),
        SizedBox(
          height: heightSizer(125, context),
          width: double.infinity,
          child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: heightSizer(24, context),
                  childAspectRatio: 0.4),
              itemCount: HomeScreenViewModel.wishLists.length,
              itemBuilder: (context, index) => _MyWishListTile(
                    wishList: HomeScreenViewModel.wishLists[index],
                  )),
        ),
      ],
    );
  }
}

class _MyWishListTile extends StatelessWidget {
  const _MyWishListTile({
    Key? key,
    required this.wishList,
  }) : super(key: key);

  final WishList wishList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteNames.wishListDetailsScreen);
      },
      child: SizedBox(
        width: widthSizer(50, context),
        height: heightSizer(40, context),
        child: Row(
          children: [
            Container(
              height: widthSizer(40, context),
              width: widthSizer(40, context),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage('https://picsum.photos/200'),
                  ),
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(8)),
            ),
            SizedBox(width: widthSizer(12, context)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  wishList.name,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: widthSizer(16, context)),
                ),
                Text(
                  '${wishList.itemCount} items',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: widthSizer(12, context)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _WishListItemsSection extends StatelessWidget {
  const _WishListItemsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Wishlist items',
                style: TextStyle(
                    fontSize: widthSizer(16, context),
                    fontWeight: FontWeight.w700,
                    color: AppColors.textBlack),
              ),
              _ViewAllButton(onTap: () {
                Navigator.pushNamed(context, RouteNames.wishListItemsScreen);
              }),
            ],
          ),
        ),
        SizedBox(height: heightSizer(12, context)),
        SizedBox(
          height: heightSizer(226, context),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return WishListItemWidget(
                item: WishListItem.demoItems[index], onPressed: () {  },
              );
            },
            itemCount: HomeScreenViewModel.categories.length,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: widthSizer(12, context),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _PopularCategoriesSection extends StatelessWidget {
  const _PopularCategoriesSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Categories',
                style: TextStyle(
                    fontSize: widthSizer(16, context),
                    fontWeight: FontWeight.w700,
                    color: AppColors.textBlack),
              ),
              _ViewAllButton(onTap: () {
                Navigator.pushNamed(context, RouteNames.popularCategories);
              })
            ],
          ),
        ),
        SizedBox(height: heightSizer(12, context)),
        SizedBox(
          height: heightSizer(120, context),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CategoryItem(
                  width: widthSizer(140, context),
                  height: heightSizer(80, context),
                  label: HomeScreenViewModel.categories[index]);
            },
            itemCount: HomeScreenViewModel.categories.length,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: widthSizer(6, context),);
            },
          ),
        ),
      ],
    );
  }
}

class _ViewAllButton extends StatelessWidget {
  const _ViewAllButton({
    Key? key,
    this.color = AppColors.primaryColor,
    required this.onTap,
  }) : super(key: key);

  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            'View all',
            style: TextStyle(
                color: color,
                fontSize: widthSizer(14, context),
                fontWeight: FontWeight.normal),
          ),
          Icon(IWishIcons.fluent_ios_arrow_ltr_24_regular,
              size: 18, color: color)
        ],
      ),
    );
  }
}
