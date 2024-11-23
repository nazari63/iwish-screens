import 'package:flutter/material.dart';
import 'package:wish_list/ui/screens/wallet_screens/wallet_view_model.dart';
import 'package:wish_list/utils/router/route_names.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../../../utils/i_wish_icons.dart';
import '../../../utils/service_locator.dart';
import '../../../utils/validators.dart';
import '../../../utils/widget_size_utils.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/general_button.dart';
import 'components/card_added_successfully_dialog.dart';

class SetTransactionPinScreen extends StatefulWidget {
  const SetTransactionPinScreen({Key? key}) : super(key: key);

  @override
  State<SetTransactionPinScreen> createState() =>
      _SetTransactionPinScreenState();
}

class _SetTransactionPinScreenState extends State<SetTransactionPinScreen> {
  bool obscurePassword = true;

  final _pinTextController = TextEditingController();

  final _confirmPinTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWithBackButton(),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: widthSizer(24, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: heightSizer(19, context),
              ),
              Text(
                'Transaction pin',
                style: AppTextStyles.heading2(context)
                    .copyWith(fontSize: widthSizer(24, context)),
              ),
              SizedBox(height: heightSizer(12, context)),
              Text(
                'Please enter a transaction pin. This pin will be used whenever you want to perform any transaction with your i-wish wallet',
                style: AppTextStyles.mediumBodyText(context)
                    .copyWith(color: AppColors.textBlack),
              ),
              SizedBox(height: heightSizer(24, context)),
              CustomTextFieldWithLabel(
                controller: _pinTextController,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                label: 'Enter PIN',
                keyboardType: TextInputType.number,
                validator: Validators.isValidNumber,
                obscureText: obscurePassword,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                  child: const Icon(IWishIcons.fluent_eye_24_regular,
                      color: AppColors.textBlack),
                ),
              ),
              SizedBox(height: heightSizer(24, context)),
              CustomTextFieldWithLabel(
                controller: _confirmPinTextController,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                label: 'Confirm PIN',
                keyboardType: TextInputType.number,
                obscureText: obscurePassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Field is required";
                  } else if (_pinTextController.text !=
                      _confirmPinTextController.text) {
                    return "Pins do not match";
                  }

                  return null;
                },
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                  child: const Icon(IWishIcons.fluent_eye_24_regular,
                      color: AppColors.textBlack),
                ),
              ),
              SizedBox(height: heightSizer(48, context)),
              GeneralButton(
                buttonText: 'Add Card',
                onPressed: () {
                  Navigator.popUntil(context, (route) {
                    final routeName = route.settings.name;
                    return (routeName == RouteNames.vendorWalletScreen) ||
                        (routeName == RouteNames.wisherWalletScreen);
                  });
                  serviceLocator<WalletViewModel>().addCard();
                  CardAddedSuccessfullyDialog.show(context);
                },
                textFontWeight: FontWeight.w400,
                textFontSize: widthSizer(16, context),
              )
            ],
          )),
    );
  }
}
