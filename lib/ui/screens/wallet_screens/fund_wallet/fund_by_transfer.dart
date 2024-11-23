import 'package:flutter/material.dart';
import 'package:wish_list/ui/widgets/general_button.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../../utils/i_wish_icons.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_text_form_field.dart';

class FundWalletByTransferScreen extends StatelessWidget {
  const FundWalletByTransferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWithBackButton(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: widthSizer(24, context)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: heightSizer(10, context)),
          Text(
            'Add By Transfer',
            style: AppTextStyles.heading2(context)
                .copyWith(fontSize: widthSizer(24, context)),
          ),
          SizedBox(height: heightSizer(12, context)),
          Text(
            'You can fund your wallet through bank transfer by simply using the details below:',
            style: AppTextStyles.mediumBodyText(context)
                .copyWith(color: AppColors.textBlack),
          ),
          SizedBox(height: heightSizer(24, context)),
          CustomTextFieldWithLabel(
            hintTextStyle:
                AppTextStyles.bodyText(context).copyWith(color: Colors.white),
            fillColor: const Color(0xFFA0A0A0),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
            label: 'Bank Name',
            hintText: 'Wema Bank',
            readOnly: true,
          ),
          SizedBox(height: heightSizer(24, context)),
          CustomTextFieldWithLabel(
            hintTextStyle:
                AppTextStyles.bodyText(context).copyWith(color: Colors.white),
            fillColor: const Color(0xFFA0A0A0),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
            label: 'Account number',
            hintText: '0125864991',
            readOnly: true,
            suffixIcon: const Icon(
              IWishIcons.fluent_copy_16_regular,
              color: Colors.white,
            ),
          ),
          SizedBox(height: heightSizer(24, context)),
          CustomTextFieldWithLabel(
            hintTextStyle:
                AppTextStyles.bodyText(context).copyWith(color: Colors.white),
            fillColor: const Color(0xFFA0A0A0),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
            label: 'Account Name',
            hintText: 'Unuefe Ejoke',
            readOnly: true,
          ),
          const Spacer(),
          GeneralButton(
            buttonText: 'Share',
            onPressed: () {},
            textFontWeight: FontWeight.w400,
            textFontSize: widthSizer(16, context),
          ),
          SizedBox(height: heightSizer(39, context))
        ]),
      ),
    );
  }
}
