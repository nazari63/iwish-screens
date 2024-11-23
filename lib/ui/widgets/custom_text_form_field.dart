import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wish_list/utils/app_colors.dart';

import '../../utils/app_text_styles.dart';
import '../../utils/widget_size_utils.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {Key? key,
      this.hintText = '',
      this.maxLines = 1,
      this.initialValue,
      this.obscureText = false,
      this.keyboardType,
      this.suffixIcon,
      this.prefixIcon,
      this.helperText,
      this.helperTextStyle,
      this.validator,
      this.textStyle,
      this.isFilled = true,
      this.fillColor = const Color(0xFFF5F5F5),
      this.textColor = AppColors.textBlack,
      this.inputBorder = const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide.none),
      this.onChanged,
      this.textCapitalization = TextCapitalization.none,
      this.showLabelOnTop = false,
      this.readOnly = false,
      TextEditingController? controller,
      this.inputFormatters,
      this.autoValidateMode = AutovalidateMode.onUserInteraction,
      this.contentPadding =
          const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      this.width,
      this.hintTextStyle,
      this.textAlign = TextAlign.start,
      this.prefixIconConstraints,
      this.onEditingComplete})
      : controller = controller ?? TextEditingController(text: initialValue),
        super(key: key) {
    /// we add this part for incase we pass a controller and also poss a initial value
    /// this ensures that the controller always has the initial value passed
    if (initialValue != null && initialValue!.isNotEmpty) {
      this.controller.text = initialValue ?? "";
    }
  }

  final int maxLines;
  final String hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String? initialValue;
  final double? width;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final InputBorder? inputBorder;
  final Color? fillColor;
  final bool isFilled;
  final Color? textColor;
  final TextAlign textAlign;

  /// Displays the label on top of the textfield when edited
  final bool showLabelOnTop;
  final bool readOnly;
  final String? helperText;
  final TextStyle? helperTextStyle;
  final String? Function(String?)? validator;
  final AutovalidateMode autoValidateMode;
  final void Function(String?)? onChanged;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsets? contentPadding;
  final BoxConstraints? prefixIconConstraints;
  final VoidCallback? onEditingComplete;

  /// Defaults to
  /// TextStyle(
  ///  fontSize: widthSizer(14, context),
  ///  color: textColor,
  ///  fontWeight: FontWeight.w600,
  /// )
  final TextStyle? textStyle;

  /// Defaults to
  /// TextStyle(
  ///   fontSize: widthSizer(14, context),
  ///   color: Color(0xFF959494),
  ///   fontWeight: FontWeight.w600,
  ///  )
  final TextStyle? hintTextStyle;

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = TextStyle(
        fontSize: widthSizer(14, context),
        color: textColor,
        fontWeight: FontWeight.normal);

    final defaultHintTextStyle =
        defaultTextStyle.copyWith(color: const Color(0xFF959494));

    return SizedBox(
      width: width,
      child: TextFormField(
        maxLines: maxLines,
        readOnly: readOnly,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
        autovalidateMode: autoValidateMode,
        onChanged: onChanged,
        style: textStyle ?? defaultTextStyle,
        cursorColor: textStyle?.color ?? textColor,
        textCapitalization: textCapitalization,
        inputFormatters: inputFormatters,
        onEditingComplete: onEditingComplete,
        textAlign: textAlign,
        decoration: InputDecoration(
            contentPadding: contentPadding,
            isDense: true,
            fillColor: fillColor,
            filled: isFilled,
            enabledBorder: inputBorder,
            focusedBorder: inputBorder,
            border: inputBorder,
            errorMaxLines: 4,
            hintText: hintText,
            label:
                showLabelOnTop ? Text(hintText, style: defaultTextStyle) : null,
            hintStyle: hintTextStyle ?? defaultHintTextStyle,
            helperText: helperText,
            helperStyle: helperTextStyle ?? defaultTextStyle,
            prefixIconConstraints: prefixIconConstraints,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon),
      ),
    );
  }
}

class CustomTextFieldWithLabel extends StatelessWidget {
  const CustomTextFieldWithLabel(
      {Key? key,
      required this.label,
      this.contentPadding =
          const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      this.controller,
      this.validator,
      this.inputBorder = const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide.none),
      this.isFilled = true,
      this.labelColor = AppColors.textBlack,
      this.readOnly = false,
      this.fillColor = const Color(0xFFF5F5F5),
      this.keyboardType,
      this.inputFormatters,
      this.hintTextStyle,
      this.initialValue,
      this.onChanged,
      this.textCapitalization = TextCapitalization.words,
      this.hintText = '',
      this.maxLines = 1,
      this.suffixIcon,
      this.obscureText = false})
      : super(key: key);

  final String label;
  final int maxLines;
  final TextEditingController? controller;
  final InputBorder inputBorder;
  final bool isFilled;
  final Color? fillColor;
  final TextStyle? hintTextStyle;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final void Function(String?)? onChanged;
  final TextCapitalization textCapitalization;
  final Widget? suffixIcon;
  final EdgeInsets? contentPadding;
  final bool obscureText;
  final bool readOnly;
  final Color labelColor;
  @override
  Widget build(BuildContext context) {
    final hintStyle =
        AppTextStyles.bodyText(context).copyWith(color: AppColors.grey);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: AppTextStyles.bodyText(context).copyWith(color: labelColor),
        ),
        SizedBox(height: heightSizer(12, context)),
        CustomTextFormField(
          maxLines: maxLines,
          readOnly: readOnly,
          hintText: hintText,
          initialValue: initialValue,
          controller: controller,
          isFilled: isFilled,
          fillColor: fillColor,
          validator: validator,
          inputFormatters: inputFormatters,
          textCapitalization: textCapitalization,
          keyboardType: keyboardType,
          suffixIcon: suffixIcon,
          obscureText: obscureText,
          onChanged: onChanged,
          contentPadding: contentPadding,
          textStyle: TextStyle(
              fontSize: widthSizer(16, context), fontWeight: FontWeight.w500),
          hintTextStyle: hintTextStyle ?? hintStyle,
          inputBorder: inputBorder,
        )
      ],
    );
  }
}
