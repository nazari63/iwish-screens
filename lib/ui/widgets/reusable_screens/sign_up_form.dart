import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wish_list/ui/widgets/divider_with_or.dart';
import 'package:wish_list/utils/validators.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/i_wish_icons.dart';
import '../../../utils/router/route_names.dart';
import '../../../utils/widget_size_utils.dart';
import '../custom_text_form_field.dart';
import '../general_button.dart';
import '../social_media_button.dart';

class SignUpForm extends StatefulWidget {
  final String title;
  final String subtitle;
  final Color eyeColor;
  final Color infoColor;
  final void Function(
      {required String name,
      required String email,
      required String userName,
      required String mobileNumber,
      required String password}) onFormSubmitted;

  const SignUpForm(
      {Key? key,
      required this.title,
      required this.subtitle,
      this.eyeColor = AppColors.lightPurple,
      this.infoColor = AppColors.lightPurple,
      required this.onFormSubmitted})
      : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool obscurePassword = true;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: widthSizer(24, context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: heightSizer(20, context)),
          Text(widget.title,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: widthSizer(24, context))),
          SizedBox(height: heightSizer(12, context)),
          Text(widget.subtitle,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColors.textBlack,
                  fontSize: widthSizer(16, context))),
          SizedBox(height: heightSizer(36, context)),
          CustomTextFieldWithLabel(
            label: 'Name',
            controller: _nameController,
            keyboardType: TextInputType.name,
            validator: Validators.isNotEmpty,
          ),
          SizedBox(height: heightSizer(24, context)),
          CustomTextFieldWithLabel(
            label: 'Email',
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: Validators.isEmail,
          ),
          SizedBox(height: heightSizer(24, context)),
          CustomTextFieldWithLabel(
            label: 'Username',
            controller: _userNameController,
            keyboardType: TextInputType.name,
            validator: Validators.isNotEmpty,
          ),
          SizedBox(height: heightSizer(24, context)),
          Row(
            children: [
              Text('Mobile Number',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: const Color(0xFF333333),
                      fontSize: widthSizer(16, context),
                      fontWeight: FontWeight.w400)),
              SizedBox(width: widthSizer(12, context)),
              GestureDetector(
                onTap: () {},
                child: Icon(
                  IWishIcons.fluent_info_24_regular,
                  color: widget.infoColor,
                  size: 18,
                ),
              )
            ],
          ),
          SizedBox(height: heightSizer(12, context)),
          CustomTextFormField(
            fillColor: const Color(0xFFF5F5F5),
            keyboardType: TextInputType.phone,
            controller: _mobileNumberController,
            validator: Validators.isValidNumberAndLength,
          ),
          SizedBox(height: heightSizer(24, context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Password',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: const Color(0xFF333333),
                      fontSize: widthSizer(16, context),
                      fontWeight: FontWeight.w400)),
              InkWell(
                onTap: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
                child: Icon(
                  IWishIcons.fluent_eye_24_regular,
                  color: widget.eyeColor,
                  size: 18,
                ),
              ),
            ],
          ),
          SizedBox(height: heightSizer(12, context)),
          CustomTextFormField(
            fillColor: const Color(0xFFF5F5F5),
            keyboardType: TextInputType.visiblePassword,
            obscureText: obscurePassword,
            controller: _passwordController,
            validator: Validators.isValidPassword,
          ),
          SizedBox(height: heightSizer(40, context)),
          GeneralButton(
              buttonText: 'Create Account',
              onPressed: () {
                widget.onFormSubmitted(
                    name: _nameController.text,
                    email: _emailController.text,
                    userName: _userNameController.text,
                    mobileNumber: _mobileNumberController.text,
                    password: _passwordController.text);
              }),
          SizedBox(height: heightSizer(48, context)),
          const DividerWithOr(),
          SizedBox(height: heightSizer(24, context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [GoogleLoginButton(), FacebookLoginButton()],
          ),
          SizedBox(height: heightSizer(62, context)),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.loginScreen);
              },
              child: RichText(
                  text: TextSpan(
                      style: GoogleFonts.nunitoSans(
                        fontSize: widthSizer(16.0, context),
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF333333),
                      ),
                      children: const [
                    TextSpan(text: 'Already have an account? '),
                    TextSpan(
                        text: 'Login',
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline))
                  ])),
            ),
          ),
          SizedBox(height: heightSizer(40, context)),
        ],
      ),
    );
  }
}
