import 'package:flutter/material.dart';
import 'package:wish_list/ui/widgets/general_button.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../../utils/i_wish_icons.dart';
import '../../../../utils/router/route_names.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/amount_selector.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_text_form_field.dart';
import 'request_money_successful_dialog.dart';

class RequestMoneyScreen extends StatelessWidget {
  const RequestMoneyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const AppBarWithBackButton(),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: widthSizer(24, context)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: heightSizer(10, context)),
                Text('Request Money', style: AppTextStyles.heading2(context)),
                SizedBox(height: heightSizer(12, context)),
                Text(
                  'You can request money by inputting a username to share a link with.',
                  style: AppTextStyles.mediumBodyText(context)
                      .copyWith(color: AppColors.textBlack),
                ),
                SizedBox(height: heightSizer(24, context)),
                CustomTextFieldWithLabel(
                  hintTextStyle: AppTextStyles.bodyText(context)
                      .copyWith(color: AppColors.grey),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                  label: 'Username',
                  hintText: 'e.g  Steve',
                ),
                SizedBox(height: heightSizer(12, context)),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, RouteNames.requestMoneyFromContactScreen);
                  },
                  child: Row(
                    children: [
                      const Icon(
                        IWishIcons.fluent_book_contacts_28_regular,
                        color: AppColors.primaryColor,
                      ),
                      SizedBox(width: widthSizer(6, context)),
                      Text(
                        'Select from contact',
                        style: AppTextStyles.heading1(context).copyWith(
                            color: AppColors.primaryColor, fontSize: 16),
                      )
                    ],
                  ),
                ),
                SizedBox(height: heightSizer(24, context)),
                AmountSelector(
                  label: 'How much do you want to request?',
                  onAmountChanged: (_) {},
                ),
                SizedBox(height: heightSizer(24, context)),
                const CustomTextFieldWithLabel(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                  label: 'Description (Optional)',
                ),
                SizedBox(height: heightSizer(48, context)),
                GeneralButton(
                  buttonText: 'Request Money',
                  onPressed: () {
                    RequestMoneySuccessfulDialog.show(context);
                  },
                  textFontWeight: FontWeight.w400,
                  textFontSize: widthSizer(16, context),
                ),
              ],
            ),
          ),
        ));
  }
}
