import 'package:flutter/material.dart';
import 'package:wish_list/ui/widgets/custom_app_bar.dart';
import 'package:wish_list/utils/app_text_styles.dart';

import '../../../../models/wish_list.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/general_button.dart';
import '../../../widgets/upload_image_container.dart';
import '../../../widgets/uploaded_image_view.dart';

class EditWishListScreen extends StatelessWidget {
  final WishList wishList;

  const EditWishListScreen({Key? key, required this.wishList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWithBackButton(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: widthSizer(24, context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Edit wishlist',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: widthSizer(24, context))),
            SizedBox(height: heightSizer(24, context)),
            CustomTextFieldWithLabel(
              label: 'Name of Wishlist',
              initialValue: wishList.name,
            ),
            SizedBox(height: heightSizer(24, context)),
            Text('Choose image',
                textAlign: TextAlign.start,
                style: AppTextStyles.bodyText(context)),
            SizedBox(height: heightSizer(12, context)),
            const UploadImageContainer(),
            SizedBox(height: heightSizer(12, context)),
            const UploadedImageView(),
            SizedBox(height: heightSizer(24, context)),
            CustomTextFieldWithLabel(
              label: 'Description (Optional)',
              fillColor: const Color(0xFFF5F5F5),
              initialValue: wishList.description,
              maxLines: 3,
            ),
            SizedBox(height: heightSizer(48, context)),
            GeneralButton(buttonText: 'Update Wishlist', onPressed: () {}),
            SizedBox(height: heightSizer(20, context)),
          ],
        ),
      ),
    );
  }
}
