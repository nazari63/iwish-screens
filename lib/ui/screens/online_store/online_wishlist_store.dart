import 'package:flutter/material.dart';
import 'package:wish_list/models/wish_list_items.dart';
import 'package:wish_list/ui/widgets/custom_app_bar.dart';
import 'package:wish_list/ui/widgets/custom_back_button.dart';
import 'package:wish_list/utils/app_text_styles.dart';

import '../../../../models/wish_list_items.dart';
import '../../../../utils/i_wish_icons.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../utils/router/route_names.dart';
import '../../widgets/bottom_nav.dart';
import '../../widgets/custom_grid_view.dart';
import '../../widgets/drawer_menu.dart';
import '../../widgets/search_bar.dart';
import '../../widgets/wishlist_item.dart';

class OnlineWishListStore extends StatelessWidget {
  const OnlineWishListStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerMenu(),
        backgroundColor: Colors.white,
        appBar: const AppBarWithActions(
          cartActive: true,
        ),
        body: WisherBottomNav(
          currentNavParent: BottomNavParent.noParent,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(widthSizer(24, context)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const CustomBackButton(
                label: 'Home',
                padding: EdgeInsets.zero,
                backRoute: RouteNames.homeScreen,
              ),
              SizedBox(height: heightSizer(24, context)),
              Text('Wishlist Store',
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
                      6,
                      (index) => WishListItemWidget(
                            forCart: true,
                            item: WishListItem.demoItems[index],
                            onPressed: () {},
                          ))),
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
