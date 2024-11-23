import 'package:flutter/material.dart';
import 'package:wish_list/ui/screens/wishlist/components/select_create_wishlist_item_mode_dialog.dart';

import '../../../../utils/app_text_styles.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/bottom_nav.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/drawer_menu.dart';
import '../../../widgets/general_button.dart';

/// Gets displayed when the wishlist is empty. i.e it has no wishlist items
class EmptyWishlistView extends StatelessWidget {
  const EmptyWishlistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerMenu(),
        backgroundColor: Colors.white,
        appBar: const AppBarWithActions(),
        body: WisherBottomNav(
            currentNavParent: BottomNavParent.wishList,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: widthSizer(100, context),
                        height: heightSizer(100, context),
                        child: Image.asset(
                            'assets/images/black_and_purple_magic_wand_with_background.png')),
                    SizedBox(height: heightSizer(24, context)),
                    Text('No item yet',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.heading2(context)),
                    SizedBox(height: heightSizer(12, context)),
                    Text('Start creating your list of wish items',
                        textAlign: TextAlign.start,
                        style: AppTextStyles.bodyText(context)),
                    SizedBox(height: heightSizer(39, context)),
                    GeneralButton(
                      buttonText: 'Create Wishlist Item',
                      height: 58,
                      onPressed: () {
                        SelectCreateWishListItemModeDialog.show(context);
                      },
                    )
                  ]),
            )));
  }
}
