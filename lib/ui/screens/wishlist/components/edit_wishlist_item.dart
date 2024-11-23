import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:wish_list/ui/widgets/upload_image_container.dart';
import 'package:wish_list/utils/app_colors.dart';
import 'package:wish_list/utils/app_text_styles.dart';

import '../../../../models/wish_list_items.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/general_button.dart';
import '../../../widgets/uploaded_image_view.dart';

class EditWishListItemScreen extends StatefulWidget {
  final WishListItem wishListItem;

  const EditWishListItemScreen({Key? key, required this.wishListItem})
      : super(key: key);

  @override
  State<EditWishListItemScreen> createState() => _EditWishListItemScreenState();
}

class _EditWishListItemScreenState extends State<EditWishListItemScreen> {
  final TextEditingController _priceTextController = MoneyMaskedTextController(
      leftSymbol: '₦',
      thousandSeparator: ',',
      decimalSeparator: '',
      precision: 0);

  @override
  Widget build(BuildContext context) {
    String chosenValue = widget.wishListItem.category;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWithBackButton(),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
            left: widthSizer(24, context),
            bottom: heightSizer(24, context),
            right: widthSizer(24, context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Edit wishlist Item',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: widthSizer(24, context))),
            SizedBox(height: heightSizer(24, context)),
            CustomTextFieldWithLabel(
              label: 'Name of Item',
              initialValue: widget.wishListItem.name,
              keyboardType: TextInputType.name,
            ),
            SizedBox(height: heightSizer(24, context)),
            CustomTextFieldWithLabel(
              label: 'Price',
              controller: _priceTextController,
              initialValue: widget.wishListItem.price.toString(),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: heightSizer(24, context)),
            Text('Category',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: widthSizer(16, context))),
            SizedBox(height: heightSizer(12, context)),
            Container(
              height: heightSizer(58, context),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(8)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  icon: const Icon(Icons.keyboard_arrow_down),
                  dropdownColor: const Color(0xFFF5F5F5),
                  isExpanded: true,
                  value: chosenValue,
                  style: AppTextStyles.bodyText(context).copyWith(
                      fontSize: widthSizer(16, context),
                      color: AppColors.textBlack),
                  iconEnabledColor: AppColors.textBlack,
                  items: <String>[
                    widget.wishListItem.category,
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: AppTextStyles.bodyText(context).copyWith(
                            fontSize: widthSizer(16, context),
                            color: AppColors.textBlack),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      chosenValue = value!;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: heightSizer(54, context)),
            const UploadImageContainer(),
            SizedBox(height: heightSizer(12, context)),
            const UploadedImageView(),
            SizedBox(height: heightSizer(48, context)),
            GeneralButton(buttonText: 'Update Wish', onPressed: () {})
          ],
        ),
      ),
    );
  }
}
