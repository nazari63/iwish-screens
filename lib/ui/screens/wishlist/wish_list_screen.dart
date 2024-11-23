import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wish_list/ui/screens/wishlist/wishlist_viewmodel.dart';
import 'package:wish_list/utils/service_locator.dart';

import '../../widgets/bottom_nav.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/drawer_menu.dart';
import 'components/my_wishlists_screen.dart';
import 'components/no_wishlist_yet.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerMenu(),
        backgroundColor: Colors.white,
        appBar: const AppBarWithActions(),
        body: WisherBottomNav(
          currentNavParent: BottomNavParent.wishList,
          child: ChangeNotifierProvider<WishListViewModel>.value(
              // create: (_) => WishListViewModel(),
              value: serviceLocator<WishListViewModel>(),
              child: Consumer<WishListViewModel>(
                builder: (context, viewModel, child) {
                  return Visibility(
                      visible: viewModel.hasWishList,
                      replacement: const NoWishListYetView(),
                      child: const MyWishListScreen());
                },
              )),
        ));
  }
}
