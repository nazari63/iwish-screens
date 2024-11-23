import 'package:flutter/material.dart';
import 'package:wish_list/ui/screens/wishlist/wishlist_viewmodel.dart';
import 'package:wish_list/ui/widgets/custom_app_bar.dart';
import 'package:wish_list/utils/app_text_styles.dart';

import '../../../../utils/service_locator.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/general_button.dart';
import '../../../widgets/upload_image_container.dart';

class CreateWishListScreen extends StatelessWidget {
  const CreateWishListScreen({Key? key}) : super(key: key);

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
            SizedBox(height: heightSizer(24, context)),
            Text('Create new wishlist',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: widthSizer(24, context))),
            SizedBox(height: heightSizer(24, context)),
            Text('Name of Wishlist',
                textAlign: TextAlign.start,
                style: AppTextStyles.bodyText(context)),
            SizedBox(height: heightSizer(12, context)),
            CustomTextFormField(fillColor: const Color(0xFFF5F5F5)),
            SizedBox(height: heightSizer(24, context)),
            Text('Choose image',
                textAlign: TextAlign.start,
                style: AppTextStyles.bodyText(context)),
            SizedBox(height: heightSizer(12, context)),
            const UploadImageContainer(),
            SizedBox(height: heightSizer(24, context)),
            Text('Description (Optional)',
                textAlign: TextAlign.start,
                style: AppTextStyles.bodyText(context)),
            SizedBox(height: heightSizer(12, context)),
            CustomTextFormField(fillColor: const Color(0xFFF5F5F5)),
            SizedBox(height: heightSizer(48, context)),
            GeneralButton(
                buttonText: 'Create Wishlist',
                onPressed: () {
                  serviceLocator<WishListViewModel>().createWishList();

                  /// Go back to the Wish List Screen
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
