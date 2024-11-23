import 'package:flutter/material.dart';
import 'package:wish_list/ui/widgets/general_button.dart';
import 'package:wish_list/utils/validators.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../../utils/i_wish_icons.dart';
import '../../../../utils/router/route_names.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/amount_selector.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../components/wallet_card.dart';

class TransferToIWishUserScreen extends StatelessWidget {
  const TransferToIWishUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWithBackButton(
        title: Text('i-Wish User', style: AppTextStyles.heading4(context)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            vertical: heightSizer(12, context),
            horizontal: widthSizer(24, context)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Transfer Money', style: AppTextStyles.heading3(context)),
          SizedBox(height: heightSizer(12, context)),
          Text(
            'Transfer to an i-wish user using their username or email',
            style: AppTextStyles.mediumBodyText(context)
                .copyWith(color: AppColors.textBlack),
          ),
          SizedBox(height: heightSizer(24, context)),
          CustomTextFieldWithLabel(
            hintTextStyle: AppTextStyles.bodyText(context)
                .copyWith(color: const Color(0xFF959494)),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
            label: 'Username or E-mail address',
            hintText: 'rukevwe@gmail.com',
            validator: Validators.isNotEmpty,
          ),
          SizedBox(height: heightSizer(24, context)),
          const EmailCard(),
          SizedBox(height: heightSizer(24, context)),
          AmountSelector(
            label: 'How much do you want to transfer?',
            onAmountChanged: (newValue) {},
          ),
          SizedBox(height: heightSizer(52, context)),
          Row(
            children: [
              const Icon(
                IWishIcons.fluent_info_20_regular,
                color: Color(0xFF2F80ED),
                size: 18,
              ),
              SizedBox(width: widthSizer(8, context)),
              Text(
                'Your daily transfer limit is 50: 45 transfers left',
                style: AppTextStyles.smallBodyText(context)
                    .copyWith(color: AppColors.textBlack),
              ),
            ],
          ),
          SizedBox(height: heightSizer(14, context)),
          GeneralButton(
            buttonText: 'Transfer Money',
            onPressed: () {
              Navigator.pushNamed(
                  context, RouteNames.enterTransferMoneyPinScreen);
            },
            textFontWeight: FontWeight.w400,
            textFontSize: widthSizer(16, context),
          ),
        ]),
      ),
    );
  }
}
