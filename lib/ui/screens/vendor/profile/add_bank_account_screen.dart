import 'package:flutter/material.dart';
import 'package:wish_list/ui/widgets/general_button.dart';
import 'package:wish_list/utils/validators.dart';

import '../../../../models/user.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../../utils/i_wish_icons.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_text_form_field.dart';

class AddBankAccountScreen extends StatelessWidget {
  AddBankAccountScreen({Key? key}) : super(key: key);

  final _mobileNumberController = TextEditingController();
  final _bankNameController = TextEditingController();
  final _accountNumberController = TextEditingController();
  final _bvnNumberController = TextEditingController();

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
                Text(
                  'Add a Bank Account',
                  style: TextStyle(
                      fontSize: widthSizer(24, context),
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: heightSizer(12, context)),
                Text(
                    'Fill in your bank details where you want your money to be deposited after purchase',
                    style: AppTextStyles.mediumBodyText(context)
                        .copyWith(color: AppColors.textBlack)),
                SizedBox(height: heightSizer(24, context)),
                CustomTextFieldWithLabel(
                  label: 'Mobile Number',
                  controller: _mobileNumberController,
                  hintText: 'What is your phone number',
                  labelColor: Colors.black,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                  validator: Validators.isValidNumberAndLength,
                ),
                SizedBox(height: heightSizer(24, context)),
                CustomTextFieldWithLabel(
                  label: 'Bank Name',
                  controller: _bankNameController,
                  hintText: 'What is the name of your bank',
                  labelColor: Colors.black,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                  validator: Validators.isNotEmpty,
                ),
                SizedBox(height: heightSizer(24, context)),
                CustomTextFieldWithLabel(
                    label: 'Account Number',
                    controller: _accountNumberController,
                    hintText: 'Your bank account number',
                    labelColor: Colors.black,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 18),
                    validator: Validators.isNotEmpty),
                SizedBox(height: heightSizer(24, context)),
                CustomTextFieldWithLabel(
                  label: 'BVN Number',
                  keyboardType: TextInputType.number,
                  hintText: 'Your Bank Verification Number',
                  labelColor: Colors.black,
                  controller: _bvnNumberController,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                  validator: (value) =>
                      Validators.isValidNumberAndLength(value, length: 10),
                ),
                SizedBox(height: heightSizer(12, context)),
                Row(
                  children: [
                    const Icon(
                      IWishIcons.fluent_info_20_regular,
                      color: Color(0xFF2F80ED),
                      size: 18,
                    ),
                    SizedBox(width: widthSizer(8, context)),
                    Text(
                      'Your BVN is required for your bank details confirmation.',
                      style: AppTextStyles.smallBodyText(context)
                          .copyWith(color: AppColors.textBlack),
                    ),
                  ],
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
                  buttonText: 'Add Bank Details',
                  onPressed: () {
                    Navigator.pop(context);
                    Vendor.demoVendor.registerBVN();
                  },
                  textFontWeight: FontWeight.w400,
                  textFontSize: widthSizer(16, context),
                ),
                SizedBox(height: heightSizer(20, context))
              ],
            )));
  }
}
