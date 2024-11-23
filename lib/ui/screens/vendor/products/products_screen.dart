import 'package:flutter/material.dart';
import 'package:wish_list/models/wish_list_items.dart';
import 'package:wish_list/ui/widgets/custom_app_bar.dart';
import 'package:wish_list/ui/widgets/custom_back_button.dart';
import 'package:wish_list/utils/app_colors.dart';
import 'package:wish_list/utils/app_text_styles.dart';

import '../../../../models/wish_list_items.dart';
import '../../../../utils/i_wish_icons.dart';
import '../../../../utils/router/route_names.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/bottom_nav.dart';
import '../../../widgets/custom_grid_view.dart';
import '../../../widgets/drawer_menu.dart';
import '../../../widgets/general_button.dart';
import '../../../widgets/vendor_product_widget.dart';

class VendorProductsScreen extends StatelessWidget {
  const VendorProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerMenu(),
        backgroundColor: Colors.white,
        appBar: const AppBarWithActions(),
        body: VendorBottomNav(
          currentNavParent: BottomNavParent.vendorProducts,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
                vertical: heightSizer(24, context),
                horizontal: widthSizer(24, context)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const CustomBackButton(padding: EdgeInsets.zero),
              SizedBox(height: heightSizer(24, context)),
              Text('Products',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: widthSizer(32, context))),
              SizedBox(height: heightSizer(12, context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '32 Products',
                    style: AppTextStyles.mediumBodyText(context),
                  ),
                  GeneralButton(
                    buttonText: 'Add Product',
                    onPressed: () {
                      Navigator.pushNamed(
                          context, RouteNames.vendorAddProductScreen);
                    },
                    padding: EdgeInsets.zero,
                    height: 48,
                    width: widthSizer(140, context),
                    textFontWeight: FontWeight.w400,
                    textFontSize: 16,
                  )
                ],
              ),
              SizedBox(height: heightSizer(36, context)),
              CustomGridView(
                  crossAxisCount: 2,
                  rowGap: 24,
                  columnGap: widthSizer(20, context),
                  items: List.generate(
                      6,
                      (index) => VendorProductWidget(
                            item: WishListItem.demoItems[index],
                            iconBackgroundColor: AppColors.textBlack,
                          ))),
              SizedBox(height: heightSizer(48, context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Load more',
                      style: AppTextStyles.mediumBodyText(context).copyWith(
                        color: AppColors.lightPurple,
                      )),
                  SizedBox(width: widthSizer(9, context)),
                  const Icon(
                    IWishIcons.arrow_down_circle,
                    size: 17,
                    color: AppColors.lightPurple,
                  )
                ],
              )
            ]),
          ),
        ));
  }
}
