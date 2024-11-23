import 'package:flutter/material.dart';
import 'package:wish_list/ui/screens/change_password/change_password_successful_dialog.dart';
import 'package:wish_list/ui/widgets/custom_back_button.dart';
import 'package:wish_list/ui/widgets/general_button.dart';
import 'package:wish_list/utils/validators.dart';

import '../../../utils/widget_size_utils.dart';
import '../../widgets/custom_text_form_field.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);

  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

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
            padding: EdgeInsets.symmetric(horizontal: widthSizer(24, context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Change Password',
                    style: TextStyle(
                      fontSize: widthSizer(24, context),
                      fontWeight: FontWeight.w700,
                    )),
                SizedBox(height: heightSizer(24, context)),
                CustomTextFieldWithLabel(
                  label: 'Old Password',
                  controller: _oldPasswordController,
                  hintText: 'Input your old password',
                  validator: Validators.isNotEmpty,
                ),
                SizedBox(height: heightSizer(24, context)),
                CustomTextFieldWithLabel(
                  label: 'New Password',
                  controller: _newPasswordController,
                  hintText: 'Input your new password',
                  validator: Validators.isValidPassword,
                ),
                SizedBox(height: heightSizer(24, context)),
                CustomTextFieldWithLabel(
                  label: 'Confirm Password',
                  controller: _confirmPasswordController,
                  hintText: 'Confirm newly inputted password',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field is required";
                    }
                    if (value != _newPasswordController.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                ),
                SizedBox(height: heightSizer(48, context)),
                GeneralButton(
                  buttonText: 'Change Password',
                  onPressed: () {
                    ChangePasswordSuccessfulDialog.show(context);
                  },
                  textFontWeight: FontWeight.w400,
                  textFontSize: widthSizer(16, context),
                ),
              ],
            )));
  }
}
