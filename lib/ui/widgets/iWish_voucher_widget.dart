import 'package:flutter/material.dart';

import '../../utils/app_text_styles.dart';
import '../../utils/widget_size_utils.dart';
import 'custom_text_form_field.dart';
import 'general_button.dart';

class IWishVoucherSection extends StatelessWidget {
  const IWishVoucherSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Got an i-wish voucher? Use it below:',
          style: AppTextStyles.heading4(context),
        ),
        SizedBox(height: heightSizer(12, context)),
        TextFieldWithButton(
          height: 58,
          hintText: 'Input voucher code',
          buttonText: 'Use Voucher',
          onTap: () {},
          buttonWidth: 140,
        )
      ],
    );
  }
}

class TextFieldWithButton extends StatelessWidget {
  final double height;
  final double buttonWidth;
  final String hintText;
  final String buttonText;
  final bool readOnly;
  final void Function() onTap;

  const TextFieldWithButton(
      {Key? key,
      required this.height,
      required this.hintText,
      required this.buttonText,
      this.readOnly = false,
      required this.onTap,
      required this.buttonWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(6),
      width: widthSizer(327, context),
      height: heightSizer(height, context),
      decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Expanded(
              child: CustomTextFormField(
            readOnly: readOnly,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            hintText: hintText,
          )),
          GeneralButton(
            padding: EdgeInsets.zero,
            buttonText: buttonText,
            textFontSize: 16,
            textFontWeight: FontWeight.w400,
            onPressed: onTap,
            width: widthSizer(buttonWidth, context),
          )
        ],
      ),
    );
  }
}
