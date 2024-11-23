import 'package:flutter/material.dart';
import 'package:wish_list/ui/widgets/general_button.dart';
import 'package:wish_list/utils/app_colors.dart';

import '../../../../utils/app_text_styles.dart';
import '../../../../utils/router/route_names.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/amount_selector.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_text_form_field.dart';

class GrantRequestScreen extends StatelessWidget {
  const GrantRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWithBackButton(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: widthSizer(24, context)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: heightSizer(10, context)),
          Text('Grant Request', style: AppTextStyles.heading2(context)),
          SizedBox(height: heightSizer(47, context)),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: widthSizer(150, context),
              height: heightSizer(150, context),
              decoration: BoxDecoration(
                  color: AppColors.grey,
                  image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage('https://i.pravatar.cc/200')),
                  borderRadius: BorderRadius.circular(widthSizer(8, context))),
            ),
          ),
          SizedBox(height: heightSizer(24, context)),
          Align(
            alignment: Alignment.center,
            child: Text('Pay Unuefe Ejoke',
                style: AppTextStyles.heading3(context)),
          ),
          SizedBox(height: heightSizer(24, context)),
          AmountSelector(
            label: 'How much do you want to send?',
            onAmountChanged: (_) {},
          ),
          SizedBox(height: heightSizer(24, context)),
          const CustomTextFieldWithLabel(
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
            label: 'Description (Optional)',
          ),
          SizedBox(height: heightSizer(48, context)),
          GeneralButton(
            buttonText: 'Send Money',
            onPressed: () {
              Navigator.pushNamed(
                  context, RouteNames.grantRequestPaymentScreen);
            },
            textFontWeight: FontWeight.w400,
            textFontSize: widthSizer(16, context),
          ),
        ]),
      ),
    );
  }
}
