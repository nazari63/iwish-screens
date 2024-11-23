import 'package:flutter/material.dart';
import 'package:wish_list/utils/app_colors.dart';
import 'package:wish_list/utils/i_wish_icons.dart';

import '../../utils/router/route_names.dart';
import '../../utils/widget_size_utils.dart';

enum BottomNavParent {
  home,
  wishList,
  giftBox,
  wallet,
  profile,
  vendorOverview,
  vendorProducts,
  vendorOrders,
  vendorWallet,
  vendorProfile,
  noParent
}

class WisherBottomNav extends StatelessWidget {
  const WisherBottomNav(
      {Key? key, required this.child, required this.currentNavParent})
      : super(key: key);

  final Widget child;

  static final List<_BottomNavItem> _wisherBottomNavItems = [
    _BottomNavItem(
        identifier: BottomNavParent.home,
        title: "Home",
        icon: IWishIcons.fluent_home_20_regular,
        routeName: RouteNames.homeScreen),
    _BottomNavItem(
        identifier: BottomNavParent.wishList,
        title: "Wish List",
        routeName: RouteNames.wishListScreen,
        icon: IWishIcons.fluent_wand_16_regular),
    _BottomNavItem(
        identifier: BottomNavParent.giftBox,
        title: "Gift Box",
        icon: IWishIcons.fluent_gift_16_regular,
        routeName: RouteNames.giftBoxScreen),
    _BottomNavItem(
        identifier: BottomNavParent.wallet,
        title: "Wallet",
        routeName: RouteNames.wisherWalletScreen,
        icon: IWishIcons.fluent_wallet_16_regular),
    _BottomNavItem(
        identifier: BottomNavParent.profile,
        title: "Profile",
        icon: IWishIcons.carbon_user_avatar,
        routeName: RouteNames.wisherProfileScreen),
  ];

  /// specify which bottom nav item is active and should be highlighted
  final BottomNavParent currentNavParent;

  @override
  Widget build(BuildContext context) {
    debugPrint(currentNavParent.name);
    return _BottomNav(
        currentNavParent: currentNavParent,
        navItems: _wisherBottomNavItems,
        child: child);
  }
}

class VendorBottomNav extends StatelessWidget {
  const VendorBottomNav(
      {Key? key, required this.child, required this.currentNavParent})
      : super(key: key);

  static final List<_BottomNavItem> _vendorBottomNavItems = [
    _BottomNavItem(
        identifier: BottomNavParent.vendorOverview,
        title: "Overview",
        icon: IWishIcons.fluent_data_pie_24_regular,
        routeName: RouteNames.vendorOverviewScreen),
    _BottomNavItem(
        identifier: BottomNavParent.vendorProducts,
        title: "Products",
        icon: IWishIcons.fluent_building_shop_16_regular,
        routeName: RouteNames.vendorProductsCategoryScreen),
    _BottomNavItem(
        identifier: BottomNavParent.vendorOrders,
        title: "Orders",
        icon: IWishIcons.fluent_document_bullet_list_24_regular,
        routeName: RouteNames.vendorOrdersScreen),
    _BottomNavItem(
        identifier: BottomNavParent.vendorWallet,
        title: "Wallet",
        routeName: RouteNames.vendorWalletScreen,
        icon: IWishIcons.fluent_wallet_16_regular),
    _BottomNavItem(
        identifier: BottomNavParent.vendorProfile,
        title: "Profile",
        icon: IWishIcons.carbon_user_avatar,
        routeName: RouteNames.vendorProfileScreen),
  ];

  final Widget child;

  /// specify which bottom nav item is active and should be highlighted
  final BottomNavParent currentNavParent;

  @override
  Widget build(BuildContext context) {
    debugPrint(currentNavParent.name);
    return _BottomNav(
      currentNavParent: currentNavParent,
      navItems: _vendorBottomNavItems,
      child: child,
    );
  }
}

class _BottomNav extends StatelessWidget {
  const _BottomNav(
      {Key? key,
      required this.child,
      required this.currentNavParent,
      required this.navItems})
      : super(key: key);

  final Widget child;
  final List<_BottomNavItem> navItems;

  /// specify which bottom nav item is active and should be highlighted
  final BottomNavParent currentNavParent;

  @override
  Widget build(BuildContext context) {
    debugPrint(currentNavParent.name);
    return Material(
      child: SizedBox(
        height: ScreenSize.height(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(child: child),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List<Widget>.generate(navItems.length, (index) {
                final navItem = navItems[index];
                bool isActive = navItem.identifier == currentNavParent;
                return TextButton(
                  onPressed: () {
                    if (isActive) {
                      Navigator.popUntil(context,
                          (route) => route.settings.name == navItem.routeName);
                    } else {
                      Navigator.pushNamed(context, navItem.routeName);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: widthSizer(8, context),
                        vertical: heightSizer(6, context)),
                    decoration: BoxDecoration(
                        color: isActive
                            ? AppColors.primaryColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        Icon(navItem.icon,
                            color: isActive
                                ? Colors.white
                                : const Color(0xFFABAAAA),
                            size: isActive ? 22 : 20),
                        SizedBox(height: heightSizer(3, context)),
                        Text(navItem.title,
                            style: TextStyle(
                                color: isActive
                                    ? Colors.white
                                    : const Color(0xFFABAAAA),
                                fontSize: widthSizer(10, context)))
                      ],
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}

class _BottomNavItem {
  final BottomNavParent identifier;
  final IconData icon;

  /// Route to navigate to when bottom nav item is clicked
  final String routeName;
  final String title;

  _BottomNavItem(
      {required this.icon,
      required this.title,
      required this.routeName,
      required this.identifier});
}
