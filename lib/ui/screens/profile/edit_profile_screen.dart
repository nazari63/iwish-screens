import 'package:flutter/material.dart';
import 'package:wish_list/ui/widgets/custom_back_button.dart';
import 'package:wish_list/ui/widgets/general_button.dart';
import 'package:wish_list/utils/validators.dart';

import '../../../models/user.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/router/route_names.dart';
import '../../../utils/widget_size_utils.dart';
import '../../widgets/custom_text_form_field.dart';

class EditProfileScreen extends StatelessWidget {
  final User user;
  const EditProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 150,
        leading: const CustomBackButton(label: 'Profile'),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              horizontal: widthSizer(24, context),
              vertical: heightSizer(12, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Edit Profile',
                  style: TextStyle(
                    fontSize: widthSizer(24, context),
                    fontWeight: FontWeight.w700,
                  )),
              SizedBox(height: heightSizer(24, context)),
              CustomTextFieldWithLabel(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                label: 'Name',
                initialValue: user.name,
                validator: Validators.isNotEmpty,
              ),
              SizedBox(height: heightSizer(24, context)),
              CustomTextFieldWithLabel(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                label: 'Email',
                initialValue: user.email,
                validator: Validators.isEmail,
              ),
              SizedBox(height: heightSizer(24, context)),
              CustomTextFieldWithLabel(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                label: 'Mobile Number',
                initialValue: user.mobileNumber,
                validator: (value) => Validators.isValidNumberAndLength(value),
              ),
              SizedBox(height: heightSizer(24, context)),
              Visibility(
                visible: user is Wisher,
                replacement: const SizedBox(),
                child: Column(
                  children: [
                    CustomTextFieldWithLabel(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 18),
                      label: 'Billing Address',
                      initialValue:
                          user is Wisher ? (user as Wisher).billingAddress : "",
                      validator: Validators.isEmail,
                    ),
                    SizedBox(height: heightSizer(24, context)),
                  ],
                ),
              ),
              Text(
                'Password',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: widthSizer(16, context)),
              ),
              SizedBox(height: heightSizer(12, context)),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, RouteNames.changePassword);
                },
                child: Text(
                  'Change Password',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: widthSizer(16, context),
                      color: (user is Vendor)
                          ? AppColors.primaryColor
                          : Colors.black),
                ),
              ),
              SizedBox(height: heightSizer(48, context)),
              GeneralButton(
                buttonText: 'Save Changes',
                onPressed: () {},
                textFontWeight: FontWeight.w400,
                textFontSize: widthSizer(16, context),
              ),
            ],
          )),
    );
  }
}
