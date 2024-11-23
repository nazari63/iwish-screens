import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:wish_list/utils/app_colors.dart';
import '../../../utils/widget_size_utils.dart';
import '../../utils/validators.dart';

class PinTextInput extends StatelessWidget {
  final TextEditingController pinTextController;
  final bool obscurePin;
  final bool showOnlyBottomBorder;
  final bool useNativeKeyboard;

  ///Defaults to
  ///(value) => Validators.isLength(value, 4, fieldName: "Pin")
  final String? Function(String?)? validator;

  const PinTextInput(
      {Key? key,
      required this.pinTextController,
      this.obscurePin = false,
      this.validator,
      this.showOnlyBottomBorder = false,
      this.useNativeKeyboard = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultTheme = PinTheme(
      width: widthSizer(53, context),
      height: heightSizer(53, context),
      textStyle: TextStyle(
          fontSize: widthSizer(24, context), color: const Color(0xFF444444)),
      decoration: !showOnlyBottomBorder
          ? BoxDecoration(
              color: const Color(0xFFD9D9D9),
              // border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            )
          : const BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.primaryColor)),
              borderRadius: null),
    );

    return Pinput(
      length: 5,
      onCompleted: (pin) => debugPrint(pin),
      controller: pinTextController,
      obscureText: obscurePin,
      obscuringCharacter: '●',
      useNativeKeyboard: useNativeKeyboard,
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
      forceErrorState: true,
      separator: SizedBox(width: widthSizer(13, context)),
      validator: validator ??
          (value) => Validators.isLength(value, 5, fieldName: "Pin"),
      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            width: widthSizer(28, context),
            height: 2,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
      defaultPinTheme: defaultTheme,
      focusedPinTheme: defaultTheme.copyBorderWith(
          border: !showOnlyBottomBorder
              ? Border.all(color: AppColors.primaryColor)
              : const Border(
                  bottom: BorderSide(color: AppColors.primaryColor))),
      /*errorPinTheme: defaultTheme.copyBorderWith(
          border: !showOnlyBottomBorder
              ? Border.all(color: Colors.red)
              : const Border(bottom: BorderSide(color: Colors.red))),*/
      submittedPinTheme: defaultTheme.copyBorderWith(
          border: !showOnlyBottomBorder
              ? Border.all(color: AppColors.primaryColor)
              : const Border(
                  bottom: BorderSide(color: AppColors.primaryColor))),
    );
  }
}
