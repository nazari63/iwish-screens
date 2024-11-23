import 'package:flutter/material.dart';

import '../../../../models/product.dart';
import '../../../../models/wish_list_items.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../../utils/i_wish_icons.dart';
import '../../../../utils/router/route_names.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_grid_view.dart';
import '../../../widgets/general_button.dart';
import '../../../widgets/wishlist_item.dart';
import '../components/item_unavailable_dialog.dart';

class GrantWishProductDescriptionScreen extends StatefulWidget {
  final Product product;

  const GrantWishProductDescriptionScreen({Key? key, required this.product})
      : super(key: key);

  @override
  State<GrantWishProductDescriptionScreen> createState() =>
      _GrantWishProductDescriptionScreenState();
}

class _GrantWishProductDescriptionScreenState
    extends State<GrantWishProductDescriptionScreen> {
  int selectedSizeIndex = 0;
  bool isFavoriteProduct = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWithBackButton(
        title: Text(
          'Grant Wish',
          style: AppTextStyles.heading4(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: widthSizer(24, context)),
        child: Column(
          children: [
            SizedBox(height: heightSizer(36, context)),
            Container(
              width: widthSizer(327, context),
              height: heightSizer(180, context),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(widget.product.productImages[0]),
                  ),
                  color: const Color(0xFFF8F8F8),
                  borderRadius: BorderRadius.circular(8)),
            ),
            SizedBox(height: heightSizer(24, context)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.product.name,
                    style: AppTextStyles.heading3(context)),
                SizedBox(height: heightSizer(12, context)),
                Text('#${widget.product.priceString}',
                    style: AppTextStyles.heading4(context)),
                SizedBox(height: heightSizer(24, context)),
                Visibility(
                  visible: widget.product.description.isNotEmpty,
                  replacement: const SizedBox(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Product Description',
                          style: AppTextStyles.heading4(context)),
                      SizedBox(height: heightSizer(12, context)),
                      Text(
                        widget.product.description,
                        style: AppTextStyles.mediumBodyText(context)
                            .copyWith(color: const Color(0xFF333333)),
                      ),
                      SizedBox(height: heightSizer(24, context)),
                      Text('Available Colors',
                          style: AppTextStyles.heading4(context)),
                      SizedBox(height: heightSizer(12, context)),
                      _ProductColorSelector(
                        onNewSizeSelected: (index) {
                          setState(() {
                            selectedSizeIndex = index;
                          });
                        },
                        selectedSizeIndex: selectedSizeIndex,
                        product: widget.product,
                      ),
                      SizedBox(height: heightSizer(118, context)),
                    ],
                  ),
                ),
                GeneralButton(
                  buttonText: 'Grant Wish',
                  onPressed: () {
                    widget.product.isAvailable
                        ? Navigator.pushNamed(
                            context, RouteNames.grantWishProductDetailsScreen,
                            arguments: widget.product)
                        : ItemUnavailableDialog.show(context, widget.product);
                  },
                )
              ],
            ),
            SizedBox(height: heightSizer(31, context)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: heightSizer(21, context)),
                Text('Similar Products',
                    style: AppTextStyles.heading4(context)),
                SizedBox(height: heightSizer(24, context)),
                CustomGridView(
                    crossAxisCount: 2,
                    rowGap: 24,
                    columnGap: widthSizer(20, context),
                    items: List.generate(
                        4,
                        (index) => WishListItemWidget(
                              forGrantWish: true,
                              item: WishListItem.demoItems[index],
                              iconBackgroundColor: AppColors.textBlack, onPressed: () {  },
                            ))),
                SizedBox(height: heightSizer(52, context)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Load More',
                        style: AppTextStyles.mediumBodyText(context)),
                    SizedBox(width: widthSizer(9, context)),
                    const Icon(
                      IWishIcons.arrow_down_circle,
                      size: 17,
                    )
                  ],
                ),
                SizedBox(height: heightSizer(52, context)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _ProductColorSelector extends StatelessWidget {
  const _ProductColorSelector(
      {Key? key,
      required this.product,
      required this.onNewSizeSelected,
      required this.selectedSizeIndex})
      : super(key: key);

  final void Function(int) onNewSizeSelected;
  final int selectedSizeIndex;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSizer(38, context),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () => onNewSizeSelected(index),
                child: Container(
                  height: heightSizer(38, context),
                  padding:
                      EdgeInsets.symmetric(horizontal: widthSizer(10, context)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.lightPurple, width: 2),
                    color: index == selectedSizeIndex
                        ? AppColors.lightPurple
                        : Colors.white,
                  ),
                  child: Center(
                    child: Text(product.availableColors[index],
                        style: AppTextStyles.bodyText(context).copyWith(
                            color: index == selectedSizeIndex
                                ? Colors.white
                                : AppColors.textBlack)),
                  ),
                ),
              ),
          separatorBuilder: (context, index) =>
              SizedBox(width: widthSizer(12, context)),
          itemCount: product.availableColors.length),
    );
  }
}
