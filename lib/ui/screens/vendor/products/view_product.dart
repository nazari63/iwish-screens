import 'package:flutter/material.dart';
import 'package:swipe/swipe.dart';

import '../../../../models/product.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_back_button.dart';
import '../../../widgets/drawer_menu.dart';
import '../../../widgets/general_button.dart';
import '../../../widgets/icon_container.dart';

class VendorViewProductScreen extends StatefulWidget {
  const VendorViewProductScreen({Key? key}) : super(key: key);

  @override
  State<VendorViewProductScreen> createState() =>
      _VendorViewProductScreenState();
}

class _VendorViewProductScreenState extends State<VendorViewProductScreen> {
  int selectedSizeIndex = 0;
  bool isFavoriteProduct = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerMenu(),
        backgroundColor: Colors.white,
        appBar: const AppBarWithActions(),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: widthSizer(24, context)),
          child: Column(
            children: [
              SizedBox(height: heightSizer(24, context)),
              const Align(
                alignment: Alignment.centerLeft,
                child: CustomBackButton(padding: EdgeInsets.zero),
              ),
              SizedBox(height: heightSizer(24, context)),
              const _ProductImageCarousel(),
              SizedBox(height: heightSizer(24, context)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Product.nikeAirMax.name,
                      style: AppTextStyles.heading3(context)),
                  SizedBox(height: heightSizer(12, context)),
                  Text('#${Product.nikeAirMax.priceString}',
                      style: AppTextStyles.heading4(context)),
                  SizedBox(height: heightSizer(22, context)),
                  Text('Product Description',
                      style: AppTextStyles.heading4(context)),
                  SizedBox(height: heightSizer(12, context)),
                  Text(
                    Product.nikeAirMax.description,
                    style: TextStyle(
                        color: AppColors.textBlack,
                        fontWeight: FontWeight.w400,
                        fontSize: widthSizer(14, context)),
                  ),
                  SizedBox(height: heightSizer(31, context)),
                  Text('Available Sizes',
                      style: AppTextStyles.heading4(context)),
                  SizedBox(height: heightSizer(12, context)),
                  _ProductSizeSelector(
                      onNewSizeSelected: (index) {
                        setState(() {
                          selectedSizeIndex = index;
                        });
                      },
                      selectedSizeIndex: selectedSizeIndex),
                  SizedBox(height: heightSizer(24, context)),
                  GeneralButton(
                    buttonText: 'Edit Product',
                    onPressed: () {},
                  ),
                  SizedBox(height: heightSizer(24, context)),
                  GeneralButton(
                    buttonText: 'Unpublish Product',
                    onPressed: () {},
                    buttonColor: Colors.white,
                    textColor: AppColors.primaryColor,
                    textFontWeight: FontWeight.w700,
                    textFontSize: 16,
                  ),
                  SizedBox(height: heightSizer(52, context)),
                ],
              ),
            ],
          ),
        ));
  }
}

class _ProductImageCarousel extends StatefulWidget {
  const _ProductImageCarousel({Key? key}) : super(key: key);

  @override
  State<_ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<_ProductImageCarousel> {
  int selectedImage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Swipe(
          onSwipeLeft: () {
            setState(() {
              if (selectedImage != 2) {
                selectedImage += 1;
              } else {
                selectedImage = 0;
              }
            });
          },
          onSwipeRight: () {
            setState(() {
              if (selectedImage != 0) {
                selectedImage -= 1;
              } else {
                selectedImage = 2;
              }
            });
          },
          child: Container(
            width: widthSizer(327, context),
            height: heightSizer(180, context),
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      Product.nikeAirMax.productImages[selectedImage]),
                ),
                color: const Color(0xFFF8F8F8),
                borderRadius: BorderRadius.circular(8)),
          ),
        ),
        SizedBox(height: heightSizer(12, context)),
        SizedBox(
          height: heightSizer(44, context),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) => Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedImage = index;
                        });
                      },
                      child: Container(
                        width: widthSizer(44, context),
                        height: heightSizer(44, context),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: index == selectedImage
                                    ? const Color(0xFFDCC1FF)
                                    : Colors.transparent),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  Product.nikeAirMax.productImages[index]),
                            ),
                            color: const Color(0xFFF8F8F8),
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
              separatorBuilder: (context, index) =>
                  SizedBox(width: widthSizer(12, context)),
              itemCount: Product.nikeAirMax.productImages.length),
        ),
      ],
    );
  }
}

class _ProductSizeSelector extends StatelessWidget {
  const _ProductSizeSelector(
      {Key? key,
      required this.onNewSizeSelected,
      required this.selectedSizeIndex})
      : super(key: key);

  final void Function(int) onNewSizeSelected;
  final int selectedSizeIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSizer(38, context),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () => onNewSizeSelected(index),
                child: IconContainer(
                  width: widthSizer(40, context),
                  height: heightSizer(38, context),
                  bordered: true,
                  borderColor: AppColors.lightPurple,
                  backgroundColor: index == selectedSizeIndex
                      ? const Color(0xFF9747FF)
                      : Colors.white,
                  child: Center(
                    child: Text(
                      Product.nikeAirMax.availableSizes[index],
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: widthSizer(16, context),
                          color: index == selectedSizeIndex
                              ? Colors.white
                              : const Color(0xFF333333)),
                    ),
                  ),
                ),
              ),
          separatorBuilder: (context, index) => SizedBox(
                width: widthSizer(12, context),
              ),
          itemCount: Product.nikeAirMax.availableSizes.length),
    );
  }
}
