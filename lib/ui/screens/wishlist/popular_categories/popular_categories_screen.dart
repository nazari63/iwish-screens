import 'package:flutter/material.dart';

import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/bottom_nav.dart';
import '../../../widgets/category_item.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_back_button.dart';
import '../../../widgets/custom_grid_view.dart';
import '../../../widgets/drawer_menu.dart';
import '../../home_screens/home_screen_view_model.dart';

class PopularCategoriesScreen extends StatelessWidget {
  const PopularCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerMenu(),
        backgroundColor: Colors.white,
        appBar: const AppBarWithActions(),
        body: WisherBottomNav(
          currentNavParent: BottomNavParent.home,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Expanded(
                child: SingleChildScrollView(
              padding: EdgeInsets.all(widthSizer(24, context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomBackButton(padding: EdgeInsets.zero),
                  SizedBox(height: heightSizer(24, context)),
                  Text('Popular Categories',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: widthSizer(32, context))),
                  SizedBox(height: heightSizer(24, context)),
                  CustomGridView(
                      crossAxisCount: 2,
                      rowGap: 4,
                      columnGap: 4,
                      items: List.generate(
                          HomeScreenViewModel.categories.length,
                          (index) => CategoryItem(
                                width: widthSizer(152, context),
                                height: heightSizer(100, context),
                                label: HomeScreenViewModel.categories[index],
                              ))),
                  // GridView.builder(
                  //     shrinkWrap: true,
                  //     padding: EdgeInsets.zero,
                  //     gridDelegate:
                  //         const SliverGridDelegateWithFixedCrossAxisCount(
                  //             crossAxisCount: 2,
                  //             crossAxisSpacing: 4,
                  //             mainAxisSpacing: 4,
                  //             childAspectRatio: 1.2),
                  //     itemCount: HomeScreenViewModel.categories.length,
                  //     itemBuilder: (context, index) => CategoryItem(
                  //           width: widthSizer(152, context),
                  //           height: heightSizer(100, context),
                  //           label: HomeScreenViewModel.categories[index],
                  //         )),
                ],
              ),
            ))
          ]),
        ));
  }
}
