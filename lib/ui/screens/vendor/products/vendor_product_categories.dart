import 'package:flutter/material.dart';
import 'package:wish_list/ui/widgets/custom_app_bar.dart';

import '../../../../utils/app_text_styles.dart';
import '../../../../utils/router/route_names.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/bottom_nav.dart';
import '../../../widgets/category_item.dart';
import '../../../widgets/custom_grid_view.dart';
import '../../../widgets/drawer_menu.dart';
import '../../../widgets/general_button.dart';
import '../../../widgets/icon_container.dart';
import '../../home_screens/home_screen_view_model.dart';

class VendorProductsCategoryScreen extends StatelessWidget {
  const VendorProductsCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerMenu(),
        backgroundColor: Colors.white,
        appBar: const AppBarWithActions(),
        body: VendorBottomNav(
          currentNavParent: BottomNavParent.vendorProducts,
          child: SingleChildScrollView(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: widthSizer(23, context)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: heightSizer(24, context)),
              Text('Product Categories',
                  textAlign: TextAlign.start,
                  style: AppTextStyles.heading2(context)),
              SizedBox(height: heightSizer(24, context)),
              CustomGridView(
                  crossAxisCount: 2,
                  rowGap: heightSizer(31, context),
                  columnGap: widthSizer(24, context),
                  items: List.generate(
                    4,
                    (index) => _VendorCategoryItem(
                        label: HomeScreenViewModel.categories[index]),
                  )),
              SizedBox(height: heightSizer(60, context)),
              GeneralButton(
                buttonText: 'Add Category',
                onPressed: () {},
                textFontSize: 16,
                textFontWeight: FontWeight.w400,
              )
            ]),
          )),
        ));
  }
}

class _VendorCategoryItem extends StatelessWidget {
  const _VendorCategoryItem({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, RouteNames.vendorProductsScreen);
        },
        child: CategoryItem(
          width: widthSizer(152, context),
          height: heightSizer(100, context),
          label: label,
        ),
      ),
      const Positioned(
        top: 8,
        right: 8,
        child: IconContainer(
          backgroundColor: Color(0xFF080016),
          width: 24,
          child: Icon(
            Icons.more_horiz,
            color: Colors.white,
            size: 14,
          ),
        ),
      )
    ]);
  }
}
