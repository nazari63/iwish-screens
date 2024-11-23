import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wish_list/ui/widgets/custom_app_bar.dart';
import 'package:wish_list/utils/app_text_styles.dart';

import '../../../../utils/widget_size_utils.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/i_wish_icons.dart';
import '../../../utils/router/route_names.dart';
import '../../../utils/service_locator.dart';
import '../../widgets/bottom_nav.dart';
import '../../widgets/custom_grid_view.dart';
import '../../widgets/drawer_menu.dart';
import '../../widgets/filter_tag.dart';
import '../../widgets/gitbox_item.dart';
import '../../widgets/search_bar.dart';
import 'giftbox_screen_model.dart';

class GiftBoxScreen extends StatelessWidget {
  const GiftBoxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(GiftBoxScreenViewModel.GiftBoxes);
    return Scaffold(
        drawer: const DrawerMenu(),
        backgroundColor: Colors.white,
        appBar: const AppBarWithActions(),
        body: WisherBottomNav(
            currentNavParent: BottomNavParent.giftBox,
            // Mocking the GiftBox UI using a stack
            child: ChangeNotifierProvider<GiftBoxScreenViewModel>.value(
                value: serviceLocator<GiftBoxScreenViewModel>(),
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      padding: EdgeInsets.only(
                        top: heightSizer(24, context),
                        left: widthSizer(24, context),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Gift Box',
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
                            const _FilterTags(),
                            SizedBox(height: heightSizer(20, context)),
                            const _GiftBoxItemsSection(),
                            SizedBox(height: heightSizer(24, context)),
                          ]),
                    ),
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, RouteNames.boxItemView),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: widthSizer(183, context),
                          height: heightSizer(54, context),
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                              color: const Color(0xFFFFCC00),
                              border: Border.all(
                                  color:
                                      const Color(0xFFFFCC00).withOpacity(0.3)),
                              borderRadius: BorderRadius.circular(
                                  widthSizer(50, context))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                IWishIcons
                                    .fluent_gift_card_arrow_right_24_regular,
                                color: AppColors.primaryColor,
                                size: 30,
                              ),
                              SizedBox(width: widthSizer(8, context)),
                              Text('Package Box',
                                  style: AppTextStyles.mediumBodyText(context)
                                      .copyWith(color: AppColors.primaryColor))
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ))));
  }
}

class _GiftBoxItemsSection extends StatelessWidget {
  const _GiftBoxItemsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GiftBoxScreenViewModel>(
        builder: (BuildContext context, model, child) => Container(
              padding: EdgeInsets.only(right: widthSizer(20, context)),
              child: CustomGridView(
                  crossAxisCount: 2,
                  rowGap: 40,
                  columnGap: 24,
                  items: List.generate(
                      GiftBoxScreenViewModel.demoGiftBoxes.length,
                      (index) => GiftBoxItemWidget(
                            item: GiftBoxScreenViewModel.demoGiftBoxes[index],
                          ))),

              //     GridView.builder(
              //   padding: EdgeInsets.zero,
              //   shrinkWrap: true,
              //   itemBuilder: (context, index) {
              //     return GiftBoxItemWidget(
              //       item: GiftBoxScreenViewModel.GiftBoxes[index],
              //     );
              //   },
              //   itemCount: GiftBoxScreenViewModel.GiftBoxes.length,
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2,
              //       crossAxisSpacing: 24,
              //       mainAxisSpacing: 48,
              //       childAspectRatio: 152 / 176),
              // ),
            ));
  }
}

class _FilterTags extends StatelessWidget {
  const _FilterTags({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: Text(
            'Popular Categories',
            style: AppTextStyles.heading4(context),
          ),
        ),
        SizedBox(height: heightSizer(12, context)),
        SizedBox(
          height: heightSizer(29, context),
          child: Consumer<GiftBoxScreenViewModel>(builder: (context, model, _) {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    model.makeActive(index);
                  },
                  child: FilterTag(
                    tagName: GiftBoxScreenViewModel.filterTags[index],
                    isActive: GiftBoxScreenViewModel.selectedTag == index,
                  ),
                );
              },
              itemCount: GiftBoxScreenViewModel.filterTags.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: widthSizer(12, context));
              },
            );
          }),
        ),
      ],
    );
  }
}
