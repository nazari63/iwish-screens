import 'package:flutter/material.dart';
import 'package:wish_list/ui/widgets/general_button.dart';
import 'package:wish_list/utils/validators.dart';

import '../../../../models/user.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_text_form_field.dart';

class AddBusinessDetailsScreen extends StatelessWidget {
  AddBusinessDetailsScreen({Key? key}) : super(key: key);

  final _businessNameController = TextEditingController();
  final _emailAddressController = TextEditingController();
  final _businessAddressController = TextEditingController();
  final _rcNumberController = TextEditingController();
  final _websiteLinkController = TextEditingController();
  final _businessDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWithBackButton(
          leadingWidth: 150,
          backButtonText: 'Profile',
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: widthSizer(24, context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Business Information',
                    style: TextStyle(
                      fontSize: widthSizer(24, context),
                      fontWeight: FontWeight.w700,
                    )),
                SizedBox(height: heightSizer(12, context)),
                Text('Complete important information about your business.',
                    style: AppTextStyles.mediumBodyText(context)
                        .copyWith(color: AppColors.textBlack)),
                SizedBox(height: heightSizer(24, context)),
                CustomTextFieldWithLabel(
                  label: 'Business Name',
                  controller: _businessNameController,
                  hintText: 'e.g AKT Stores',
                  labelColor: Colors.black,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                  validator: Validators.isNotEmpty,
                ),
                SizedBox(height: heightSizer(24, context)),
                CustomTextFieldWithLabel(
                  label: 'Business Email Address',
                  controller: _emailAddressController,
                  hintText: 'The email address of your business',
                  labelColor: Colors.black,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                  validator: Validators.isEmail,
                ),
                SizedBox(height: heightSizer(24, context)),
                CustomTextFieldWithLabel(
                    label: 'Business Address',
                    controller: _businessAddressController,
                    hintText: 'e.g 3, Imam Ligali Street',
                    labelColor: Colors.black,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 18),
                    validator: Validators.isNotEmpty),
                SizedBox(height: heightSizer(24, context)),
                CustomTextFieldWithLabel(
                  label: 'RC Number',
                  keyboardType: TextInputType.number,
                  hintText: 'e.g 01-657793',
                  labelColor: Colors.black,
                  controller: _rcNumberController,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                  validator: (value) =>
                      Validators.isValidNumberAndLength(value, length: 8),
                ),
                CustomTextFieldWithLabel(
                  label: 'Website link (Optional)',
                  controller: _websiteLinkController,
                  hintText: 'e.g www.business.com',
                  labelColor: Colors.black,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                ),
                SizedBox(height: heightSizer(24, context)),
                CustomTextFieldWithLabel(
                  label: 'Business Description',
                  controller: _businessDescriptionController,
                  hintText: 'How would you describe your business',
                  labelColor: Colors.black,
                  maxLines: 6,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                  validator: Validators.isNotEmpty,
                ),
                SizedBox(height: heightSizer(55, context)),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Please ensure your details are correct before submitting',
                    style: AppTextStyles.smallBodyText(context)
                        .copyWith(color: AppColors.textBlack),
                  ),
                ),
                SizedBox(height: heightSizer(12, context)),
                GeneralButton(
                  buttonText: 'Submit Information',
                  onPressed: () {
                    Navigator.pop(context);
                    Vendor.demoVendor.registerBusinessDetails();
                  },
                  textFontWeight: FontWeight.w400,
                  textFontSize: widthSizer(16, context),
                ),
                SizedBox(height: heightSizer(20, context))
              ],
            )));
  }
}
